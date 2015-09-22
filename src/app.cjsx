React = require 'react'
PropTypes = React.PropTypes
{Link} = require 'react-router'
{fetchItems} = require '../actions/index'
{connect} = require 'react-redux'

klass = React.createClass
  propTypes:
    data: PropTypes.object
    dispatch: PropTypes.func.isRequired

  componentDidMount: ->
    console.warn(this.state)
    { dispatch } = this.props

  render: ->
    console.log this.props
    <div>
      <h1>Prototype!?</h1>
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
      <li>
        {this.props?.items?.data}
      </li>
    </div>

mapStateToProps = (state) ->
  state

module.exports = klass
