var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var sqlite3 = require('sqlite3');
var cookieSession = require('cookie-session');
var config = require('./config');

var db = new sqlite3.Database(':memory:');
db.serialize(() => {
  db.run('create table don ('+
    'id integer primary key autoincrement,'+
    'text text(1024))');
  db.run('create table flag (flag text)');
  db.run('insert into flag values (?)', process.env.FLAG3);
});

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(cookieSession({
  name: 'session',
  keys: ['* secret keys *'],

  // Cookie Options
  maxAge: 24 * 60 * 60 * 1000 // 24 hours
}));

app.get(config.registerURL, (req, res) => {
  res.render('register');
});

app.post(config.registerURL, (req, res) => {
  req.session.registered = true;
  res.redirect('/');
});

app.get('*', (req, res, next) => {
  if (req.session.registered) {
    next();
  } else {
    res.render('notregistered');
  }
});

app.post('*', (req, res, next) => {
  if (req.session.registered) {
    next();
  } else {
    res.render('notregistered');
  }
});

app.get('/', function(req, res, next) {
  db.all('select * from don order by id desc limit 16', (error, dons) => {
    res.render('index', {dons, flag: process.env.FLAG1});
  })
});

app.post('/don', (req, res) => {
  if (req.body.text) {
    db.run('insert into don (text) values (?)', req.body.text);
  }
  res.redirect('/');
});

app.get('/edit/:id', (req, res) => {
  if (req.session.admin) {
    db.get('select * from don where id='+req.params.id, (error, don) => {
      res.render('edit', {don});
    })
  } else {
    res.render('notadmin');
  }
});

app.post('/delete/:id', (req, res) => {
  db.get('delete from don where id=?', req.params.id, (error, don) => {
    res.redirect('/');
  })
});

app.get('/admin', (req, res) => {
  if (req.session.admin) {
    res.render('admin', {flag: process.env.FLAG2});
  } else {
    res.render('notadmin');
  }
});

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
