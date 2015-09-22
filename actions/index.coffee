request = require 'superagent'
ITEMS_REQUEST = 'ITEMS_REQUEST'
ITEMS_SUCCESS = 'ITEMS_SUCCESS'
ITEMS_FAILURE = 'ITEMS_FAILURE'

requestItem = ->
  type: ITEMS_REQUEST

receiveItems = (data) ->
  type: ITEMS_SUCCESS
  data: data

fetchFailed = (err) ->
  type: ITEMS_FAILURE
  error: err

actions = { ITEMS_REQUEST, ITEMS_SUCCESS, ITEMS_FAILURE }
actions['fetchItems'] = ->
  (dispatch) ->
    dispatch(requestItem())

    request['get']('http://localhost:3000/api/v3/items')
      .end((err, response) ->
        if (err)
          dispatch(fetchFailed(err))
        else
          dispatch(receiveItems(response.body))
      )

module.exports = actions
