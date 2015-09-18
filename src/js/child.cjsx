React = require 'react'
module.exports = React.createClass
  render: ->
    console.log("Hello Child")
    <div>
      and this is the <b>{this.props.name}</b>.
    </div>
