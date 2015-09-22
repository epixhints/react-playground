React = require 'react'

{fetchItems} = require '../actions/index'

routes = require './routes'

React.render routes, document.getElementById('root2')
