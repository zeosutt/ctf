<?php
use Slim\Container;
use Slim\Http\Request;
use Slim\Http\Response;

class ArticleController
{
    private $app;

    public function __construct(Container $app) {
        $this->app = $app;
    }

    private function get_csrf_token($request) {    
        $csrf_token_keys = [
            'name' => $this->app->csrf->getTokenNameKey(),        
            'value' => $this->app->csrf->getTokenValueKey(),
        ];
        $csrf_token_values = [
            'name' => $request->getAttribute($csrf_token_keys['name']),
            'value' => $request->getAttribute($csrf_token_keys['value']),
        ];
        return [
            'keys' => $csrf_token_keys,
            'values' => $csrf_token_values,
        ];
    }
    
    public function startWriting(Request $request, Response $response, array $args){
        if (isset($_SESSION['user'])){
            return $this->app->renderer->render($response, 'new.twig', [
                'token' => $this->get_csrf_token($request)
            ]);
        } else {
            return $response->withRedirect('/', 301);            
        }
    }

    public function getArticle(Request $request, Response $response, array $args){
        if (isset($_SESSION['user'])){
            $mapper = new ArticleMapper($this->app->db);
            $article = $mapper->getArticle($args["article_key"]);
            
            if (!$article){
                $article = [
                    'article_key' => '',
                    'created_at' => '',
                    'username' => '',
                    'title' => '404',
                    'abstract' => '',
                    'body' => 'Sorry, the article you find is not found.'
                ];
            } else {
                preg_match_all('/\[#(.*?)#\]/', $article['body'], $matches);
                foreach(range(0, count($matches)-1) as $i){
                    $found_article_key = $matches[1][$i];
                    $found_article = $mapper->getArticle($found_article_key);
                    $expanded_article = "<a href=\"/articles/${found_article['article_key']}\">${found_article['title']}</a>";
                    $article['body'] = str_replace($matches[0][$i], $expanded_article, $article['body']);
                }
                
            }
            $umapper = new UserMapper($this->app->db);
            $article['username'] = $umapper->getUserInfo($article['username'])['username'];
            $article['site_key'] = getenv('SITE_KEY');
            if (isset($_GET['sent'])){
                $article['message'] = "メッセージが管理者に送信されました。";
            }
            if (isset($_GET['recaptcha-error'])){
                $article['error_message'] = "reCAPTCHA エラーです。
                ";
            }
            return $this->app->renderer->render($response, 'article.twig', $article);
        } else {
            return $response->withRedirect('/', 301);            
        }
    }
    
    public function getMyPage(Request $request, Response $response, array $args){
        if (isset($_SESSION['user'])){
            $mapper = new ArticleMapper($this->app->db);
            $articles = $mapper->getArticlesOfUser($_SESSION['user']['username']);
            return $this->app->renderer->render($response, 'mypage.twig', [
                'user' => $_SESSION['user'],
                'articles' => $articles,
            ]);
        } else {
            return $response->withRedirect('/', 301);            
        }
    }    

    public function addArticle(Request $request, Response $response, array $args){
        if (isset($_SESSION['user'])){
            if($_SESSION['user']['username']=== 'admin'){
                return $this->app->renderer->render($response, 'new.twig', [
                    'error_message' => 'admin からは記事を作成できません。',
                    'title' => $data['title'],
                    'abstract' => $data['abstract'],
                    'body' => $data['body'],
                    'token' => $this->get_csrf_token($request)                        
                ]);
            }
            
            $mapper = new ArticleMapper($this->app->db);
            $data = $request->getParsedBody();

            // escape the given body
            $body = htmlspecialchars($data['body']);
            if ($data['body'] == "" || $data['title'] == "" || $data['body'] == ""){
                return $this->app->renderer->render($response, 'new.twig', [
                    'error_message' => 'すべての入力欄を埋めてください。',
                    'title' => $data['title'],
                    'abstract' => $data['abstract'],
                    'body' => $data['body'],
                    'token' => $this->get_csrf_token($request)                        
                ]);

            }            
            // here we should only validate and shouldn't replace; [# ... #] should be replaced here because the title can be changed :-)
            preg_match_all('/\[#(.*?)#\]/', $body, $matches);
            foreach(range(0, count($matches)-1) as $i){
                $found_article_key = $matches[1][$i];
                $found_article = $mapper->getArticle($found_article_key);
                if (preg_match('/[<>"\']/', $found_article['title'])){
                    return $this->app->renderer->render($response, 'new.twig', [
                        'error_message' => '埋め込み先の記事タイトルが不正です。',
                        'title' => $data['title'],
                        'abstract' => $data['abstract'],
                        'body' => $data['body'],
                        'token' => $this->get_csrf_token($request)                        
                    ]);
                }
            }
            
            preg_match_all('/(\]|)([^\[\]]+)(\[|)/s', $body, $matches);
            foreach(range(0, count($matches)-1) as $i){
                $found_body = $matches[2][$i];
                if ($matches[1][$i] != "" || $matches[3][$i] != ""){
                    $expanded = "{$matches[1][$i]}<p>$found_body</p>{$matches[3][$i]}";
                    $body = str_replace($matches[0][$i], $expanded, $body);
                }
            }     
            preg_match_all('/\[\*(.*?)\*\]/', $body, $matches);
            foreach(range(0, count($matches)-1) as $i){
                $found_body = $matches[1][$i];
                $expanded = "<b>$found_body</b>";
                $body = str_replace($matches[0][$i], $expanded, $body);
            }
            preg_match_all('/\[\-(.*?)\-\]/', $body, $matches);
            foreach(range(0, count($matches)-1) as $i){
                $found_body = $matches[1][$i];
                $expanded = "<s>$found_body</s>";
                $body = str_replace($matches[0][$i], $expanded, $body);
            }
            preg_match_all('/\[\=(.*?)\=\]/', $body, $matches);
            foreach(range(0, count($matches)-1) as $i){
                $found_body = $matches[1][$i];
                $expanded = "<i>$found_body</i>";
                $body = str_replace($matches[0][$i], $expanded, $body);
            }
            preg_match_all('/^(#+)([^#].*)$/m', $body, $matches);
            foreach(range(0, count($matches)-1) as $i){
                $found_level = strlen($matches[1][$i]);
                $found_body = $matches[2][$i];
                $expanded = "<h$found_level>$found_body</h$found_level>";
                $body = str_replace($matches[0][$i], $expanded, $body);
            }

            
            $article_key = $mapper->createArticle($_SESSION['user']['username'],
                                                  $data['title'],
                                                  $data['abstract'],
                                                  $body);
            if ($article_key === ""){
                return $this->app->renderer->render($response, 'new.twig', [
                    'error_message' => '何らかのエラーが発生しました。',
                    'title' => $data['title'],
                    'abstract' => $data['abstract'],
                    'body' => $data['body'],
                    'token' => $this->get_csrf_token($request)                        
                ]);
            } else {
                return $response->withRedirect('/articles/'.$article_key, 301);
            }
        } else {
            return $response->withRedirect('/', 301);            
        }
    }
}
