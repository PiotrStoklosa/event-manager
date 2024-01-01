lapis = require "lapis"
import respond_to from require "lapis.application"

class App extends lapis.Application
  [index: "/"]: =>
    @html ->
      h1  'Welcome to the event manager API! You can can create, read, update or delete events here!'
      h4  'To create a new event, send a POST request to /api/events with the new event. Example of the new event:'
      h4  '{'
      h4    '"name": "<event name>",'
      h4    '"place": "<place of the event>",'
      h4    '"date": "<date in YYYY-MM-DD format>",'
      h4    '"description": "<short description>"'
      h4 '}'
      h4 'To read one event by id send GET request to the /api/events/{eventID}'
      h4 'To read all events send GET request to the /api/events'
      h4 'To update an event send PUT request to the /api/events/{eventID}'
      h4 'To delete an event send DELETE request to the /api/events/{eventID}'

  [manage_events: "/api/events"]: respond_to {
    GET: => 
      @html ->
        h1  'GET'

    POST: =>
      @html ->
        h1  'POST'

    PUT: =>
      @html ->
        h1  'PUT'
  }

  [manage_events_by_id: "/api/events/:eventID"]: respond_to {
    GET: => 
      @html ->
        h1  'GET' .. ' ' .. @params.eventID

    PUT: =>
      @html ->
        h1  'PUT' .. ' ' .. @params.eventID

    DELETE: =>
      @html ->
        h1  'DELETE' .. ' ' .. @params.eventID
  }
