<?php
return [
    'settings' => [
        'displayErrorDetails' => false, // set to false in production
        'addContentLengthHeader' => false, // Allow the web server to send the content-length header
        // Database settings
        'db' => [
            'host' => getenv('DB_HOST'),
            'port' => getenv('DB_PORT'),
            'user' => getenv('DB_USERNAME'),
            'pass' => getenv('DB_PASSWORD'),
            'dbname' => getenv('DB_DATABASE'),            
        ],

        // Renderer settings
        'renderer' => [
            'template_path' => __DIR__ . '/../templates/',
            'cache_path' => __DIR__ . '/../caches/',
        ],

        // Monolog settings
        'logger' => [
            'name' => $_ENV['APP_HOST'],
            'path' => isset($_ENV['docker']) ? 'php://stdout' : __DIR__ . '/../storage/logs/slim/app.log',
            'level' => \Monolog\Logger::DEBUG,
        ],
    ],
];
