React = require 'react'
{Router, Route} = require 'react-router'
History = require 'history'

App = require '../components/redux_app'
Parent = require './parent'

history =
  if window?
    History.createHistory()
  else
    null

module.exports =
    <Router history={history}>
      <Route path='/' component={App}>
        <Route path='/parent' component={Parent} />
      </Route>
    </Router>
