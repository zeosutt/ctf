<?php

use Slim\Http\Request;
use Slim\Http\Response;

$app->get('/', UserController::class . ':index');

// sessions (sign in/out)
$app->post('/sessions', UserController::class . ':signIn');
$app->get('/sessions', UserController::class . ':signUpView');
$app->put('/sessions', UserController::class . ':signUp');
$app->delete('/sessions', UserController::class . ':signOut');

$app->get('/mypage', ArticleController::class . ':getMyPage');
$app->get('/articles', ArticleController::class . ':startWriting');
$app->get('/articles/{article_key}', ArticleController::class . ':getArticle');
$app->put('/articles', ArticleController::class . ':addArticle');
