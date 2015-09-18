React = require 'react'
{Link} = require 'react-router'

module.exports = React.createClass
  render: ->
    console.log "Hello App"
    <div>
      <h1>Prototype</h1>
      <ul>
        <li>
          <Link to='/'>
            Home
          </Link>
        </li>
        <li>
          <Link to='/parent'>
            Parent
          </Link>
        </li>
      </ul>
      {this.props.children}
    </div>

