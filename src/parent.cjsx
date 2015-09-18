React = require 'react'
Child = require './child'

module.exports = React.createClass
  render: ->
    console.log("Hello Parent")
    <div>
      <div> This is the parent. </div>
      <Child name="child"/>
    </div>
