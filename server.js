require('node-cjsx').transform()

var path = require('path');
var express = require('express');
var createLocation = require('history/lib/createLocation')
var React = require('react');
var Router = require('react-router')

var routes = require('./src/routes')

var app = express();

app.set('view engine', 'jade')
app.use('/src', express.static('static/src'))

app.get('*', function (req, res) {
  var location = createLocation(req.url)

  
  Router.match({routes: routes, location: location}, function (err, redirectLoc, renderProps) {
    if (redirectLoc)
      res.redirect(302, redirectLoc.pathname + redirectLoc.search)
    else if (err)
      res.send(500, err.message)
    else if (renderProps == null)
      res.send(404, 'Not found')
    else
      res.render('index', { dom: React.renderToString(React.createElement(Router.RoutingContext, React.__spread({}, renderProps))) });
  });
});

app.listen(4444, 'localhost', function (err) {
  if (err) {
    console.log(err);
    return;
  }

  console.log('Listening at http://localhost:4444');
});
