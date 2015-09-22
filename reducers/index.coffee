{combineReducers} = require 'redux'
{ITEMS_REQUEST, ITEMS_SUCCESS, ITEMS_FAILURE} = require '../actions/index'

items = (state = {loading: false, error: '', data: {}}, action) ->
  newState = switch action.type
    when ITEMS_REQUEST
      Object.assign({}, state,
        loading: true
      )
    when ITEMS_SUCCESS
      Object.assign({}, state,
        loading: false
        data: action.data
      )
    when ITEMS_FAILURE
      Object.assign({}, state,
        loading: false
        error: "Failed to load items."
      )
    else
      state

  newState

module.exports = combineReducers({items: items})
