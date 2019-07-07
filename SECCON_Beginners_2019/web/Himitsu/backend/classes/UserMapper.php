<?php

class UserMapper
{
    protected $db;
    
    public function __construct($db) {
        $this->db = $db;
    }
    
    public function login($username, $password) {
        $sql = "SELECT * FROM users WHERE username=:username and password=:password";        
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam("username", $username);
        $stmt->bindParam("password", $password);
        $stmt->execute();
        return $stmt->fetch();
    }
    
    public function getUserInfo($username) {
        $sql = "SELECT * FROM users WHERE username=:username;";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam("username", $username);
        $stmt->execute();
        return $stmt->fetch();
    }

    public function createUser($username, $password){
        $sql = "INSERT INTO users (username, password) VALUES (:username, :password)";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam("username", $username);
        $stmt->bindParam("password", $password);
        $stmt->execute();
        
        return $this->login($username, $password);
    }
}
