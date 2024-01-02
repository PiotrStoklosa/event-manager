# Welcome to the event manager API! 

## How to set up and run this app locally
1. Create database ```docker run -d --name event-manager-db -e MYSQL_ROOT_PASSWORD=my-secret-pw -p 3306:3306 mysql:latest```
2. Go to container ```docker exec -it event-manager-db bash```
3. Open database ```mysql -u root -p```
4. Provide password  ```my-secret-pw```
5. Create database for the project ```use event-manager-db```
6. Create table events ```CREATE TABLE events (event_id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255) NOT NULL, place VARCHAR(255) NOT NULL, date VARCHAR(10) NOT NULL, description TEXT NOT NULL, category VARCHAR(255) NOT NULL);```
8. Download the application using ```git clone https://github.com/PiotrStoklosa/event-manager```
9. Go to the project source code ```cd event-manager```
10. Compile MoonScript code to Lua ```moonc *.moon```
11. Run Lapis server ```lapis server```

## Usage

You can can create, read, update or delete events here!
To create a new event, send a POST request to /api/events with the new event. Example of the new event:
```json=
{
  "name": "<event name>",
  "place": "<place of the event>",
  "date": "<date in YYYY-MM-DD format>",
  "description": "<short description>"
  "category": "<category, e.g. concert>"
}
```
To read one event by id send GET request to the /api/events/{eventID}

To read all events send GET request to the /api/events

To read all events from one category send GET request to the /api/events/category{categoryName}

To update an event send PUT request with updated event body to the /api/events/{eventID}

To delete an event send DELETE request to the /api/events/{eventID}

## Technologies

- MoonScript
- Lua
- Lapis
- Docker
- MySQL
