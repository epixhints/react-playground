React = require 'react'

{fetchItems} = require '../actions/index'

routes = require './routes'

window.onload = ->
  React.render routes, document.getElementById('root2')
