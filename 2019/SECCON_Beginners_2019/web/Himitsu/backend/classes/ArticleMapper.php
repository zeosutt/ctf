<?php

class ArticleMapper
{
    protected $db;
    
    public function __construct($db) {
        $this->db = $db;
    }
    
    public function createArticle($username, $title, $abstract, $body) {
        $created_at = date("Y/m/d H:i");
        $article_key = md5($username . $created_at . $title);
        $sql = "INSERT INTO articles (article_key, created_at, username, title, abstract, body) VALUES (:article_key, :created_at, :username, :title, :abstract, :body)";        
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam("article_key", $article_key);        
        $stmt->bindParam("created_at", $created_at);        
        $stmt->bindParam("username", $username);
        $stmt->bindParam("title", $title);
        $stmt->bindParam("abstract", $abstract);
        $stmt->bindParam("body", $body);        
        $stmt->execute();
        
        return $article_key;
    }
    
    public function getArticle($article_key) {
        $sql = "SELECT * FROM articles WHERE article_key = :article_key";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam("article_key", $article_key);
        $stmt->execute();
        return $stmt->fetch();
    }

    public function getArticlesOfUser($username) {
        $sql = "SELECT * FROM articles WHERE username = :username";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam("username", $username);
        $stmt->execute();
        return $stmt->fetchAll();
    }
}
