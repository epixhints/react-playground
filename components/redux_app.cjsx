React = require 'react'
thunk = require 'redux-thunk'
{createStore, applyMiddleware} = require 'redux'
{Provider} = require 'react-redux'
App = require '../reducers/index'
AppComponent = require '../src/app'

createStoreWithMiddleware = applyMiddleware(thunk)(createStore)
store = createStoreWithMiddleware(App)

unsub = store.subscribe( =>
  console.log('new state', store.getState())
)

module.exports = React.createClass
  render: ->
    <Provider store={store}>{() => <AppComponent {...this.props}/>}</Provider>
