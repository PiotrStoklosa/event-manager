Welcome to the event manager API! 

## How to set up and run this app locally

1. Download the application using ```git clone https://github.com/PiotrStoklosa/event-manager```
2. Go to the project source code: ```cd event-manager```
3. Compile moonscript code to lua: ```moonc *.moon```
4. Run lapis server: ```lapis server```

## Usage

You can can create, read, update or delete events here!
To create a new event, send a POST request to /api/events with the new event. Example of the new event:
```json=
{
  "name": "<event name>",
  "place": "<place of the event>",
  "date": "<date in YYYY-MM-DD format>",
  "description": "<short description>"
}
```
To read one event by id send GET request to the /api/events/{eventID}
To read all events send GET request to the /api/events
To update an event send PUT request to the /api/events/{eventID}
To delete an event send DELETE request to the /api/events/{eventID}

## Technologies
