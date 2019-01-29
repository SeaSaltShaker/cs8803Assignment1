//Adapted from an older implementation of a server by a teammate on my
//senior design project

var express = require('express');
var app = express();
var mongoose = require('mongoose');
var path = require('path');
var morgan = require('morgan');
var config = require('./config');
var bodyParser  = require('body-parser');

//parse POST queries
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

//configure app to handle CORS requests
app.use(function(req, res, next) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET', 'POST');
  res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With', 'content-type');
  next();
});

//log all requests to the console
app.use(morgan('dev'));

//variable for accepting promises
mongoose.Promise = global.Promise;

//connect to our database (atlas)
mongoose.connect(config.database);

//set static files location
//used for requests that our frontend will make
app.use(express.static(__dirname + '/'));

//ROUTES FOR THE API
//COMPLETE ROUTES ON RELEVANT FILE
var apiRoutes = require('./routes/api')(app, express);
app.use('/api', apiRoutes);

//MAIN CATCHALL ROUTE - SEND USERS TO FRONTEND
app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname + '/index.html'));
});

app.listen(config.port);
console.log('Test server running on port ' + config.port);