<?php
use Slim\Container;
use Slim\Http\Request;
use Slim\Http\Response;

class UserController
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
    
    public function index(Request $request, Response $response, array $args){
        if (isset($_SESSION['user'])){
            return $response->withRedirect('/mypage', 301);            
        } else {
            $values = [
                'token' => $this->get_csrf_token($request),
            ];
            if(array_key_exists('notfound', $request->getQueryParams())){
                $values['error_message'] = 'Error: そのようなユーザーが存在しません。';
            }            
            return $this->app->renderer->render($response, 'index.twig', $values);            
        }
    }

    public function signIn(Request $request, Response $response, array $args){
        $data = $request->getParsedBody();
        
        $mapper = new UserMapper($this->app->db);
        $user_record = $mapper->login($data["username"], $data["password"]);

        if ($user_record) {
            $_SESSION['user'] = $user_record;
            return $response->withRedirect('/mypage', 301);
        } else {
            return $response->withRedirect('/?notfound');
        }
    }

    public function signUp(Request $request, Response $response, array $args){
        $data = $request->getParsedBody();        
        $mapper = new UserMapper($this->app->db);
        $user_record = $mapper->getUserInfo($data["username"]);

        if ($user_record) {
            return $response->withRedirect('/sessions?duplicated');
        } else {
            $user_record = $mapper->createUser($data["username"], $data["password"]);
            $_SESSION['user'] = $user_record;
            return $response->withRedirect('/mypage', 301);
        }
    }

    public function signUpView(Request $request, Response $response, array $args){
        if (isset($_SESSION['user'])){
            return $response->withRedirect('/mypage', 301);
        } else {
            $values = [
                'token' =>  $this->get_csrf_token($request)
            ];
            if(array_key_exists('duplicated', $request->getQueryParams())){
                $values['error_message'] = 'Error: ユーザー名が重複しています。';
            }                        
            return $this->app->renderer->render($response, 'signup.twig', $values);
        }
    }

    public function signOut(Request $request, Response $response, array $args){
        $_SESSION = array();
        session_destroy();
        return $response->withRedirect('/', 301);
    }
}
