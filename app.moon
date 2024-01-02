lapis = require "lapis"
import respond_to from require "lapis.application"
import json_params from require "lapis.application"

import Model from require "lapis.db.model"

class Events extends Model
  @primary_key: "event_id"

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
      h4    '"category": "<category, e.g. concert>"'
      h4 '}'
      h4 'To read one event by id send GET request to the /api/events/{eventID}'
      h4 'To read all events send GET request to the /api/events'
      h4 'To read all events from one category send GET request to the /api/events/category{categpryName}'
      h4 'To update an event send PUT request with updated event body to the /api/events/{eventID}'
      h4 'To delete an event send DELETE request to the /api/events/{eventID}'

  [manage_events: "/api/events"]: respond_to {
    GET: => 
      json: Events\select!

    POST: json_params =>
      json: Events\create @params
  }

  [manage_events_category: "/api/events/category/:category_name"]: respond_to {
    GET: => 
      json: Events\select "where category = ?", @params.category_name
  }

  [manage_events_by_id: "/api/events/:event_id"]: respond_to {
    before: =>
        @user_id =  @params.event_id
    GET: => 
      json: Events\find @user_id

    PUT: json_params =>
      event = Events\find @user_id
      json: event\update @params

    DELETE: =>
      event = Events\find @user_id
      json: event\delete!

  }