# _Volunteer Tracker_

#### Independent project for Epicodus - 5/5/17

#### By _**Dominic Brown**_

## Description

_This is a simple app designed to demonstrate the basic implementation of a postgreSQL database.  This project will also show the use of proper RESTful routing using the language ruby combined with the Sinatra framework._

### Prerequisites

Web browser with ES6 compatibility
Ruby 2.3.1
Bundler
postgreSQL

### Installing

You can also clone this repository to your machine: navigate to the file path in your terminal, and run 'app.rb' by typing '$ruby app.rb'. If you chose to clone the repository, after you run 'app.rb' you will need to copy the localhost path into your web browser. The standard localhost for Sinatra is port 4567

#### setting up the postgreSQL database

```
# CREATE DATABASE volunteer_tracker;
# \c volunteer_tracker;
# CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, project_id int);
# CREATE TABLE projects (id serial PRIMARY KEY, title varchar);
```

## Technologies Used

* _HTML5_
* _CSS3_
* _Ruby v2.3.1_
* _Sinatra_
* _Rspec_
* _postgreSQL_
* _Capybara_
* _Bootstrap_

## Specifications

| behavior |  input   |  output  |
|----------|:--------:|:--------:|
| The app allows the user to create new projects | user enters a project title in an input field and clicks the "Add" button | the page confirms the addition was successful |
| The app allows the user to view all projects | user clicks the "view all projects" link | a new webpage appears, listing all available projects |
| The app allows the user to update a project's title | user clicks a link with the specific project title, on a new page the user then input new text and clicks an "update" button | the page confirms the update to the project was successful |
| The app allows the user to delete projects | the user selects a project link, then clicks a "remove" button | the project is removed from the list and a confirmation is shown on the page |
||||
| The app allows the user to create new volunteers | user enters a volunteer's name in an input field and clicks the "Add" button | the page confirms the addition was successful |
| The app allows the user to view all volunteers| user clicks the "view all volunteers" link | a new webpage appears, listing all available volunteers |
| The app allows the user to update a volunteer's name | user clicks a link with the specific volunteer name, on a new page the user then input new text and clicks an "update" button | the page confirms the update to the project was successful |
| The app allows the user to delete volunteers | the user selects a volunteer's link, then clicks a "remove" button | the project is removed from the list and a confirmation is shown on the page |
||||
| The app allows the user to add a volunteers to a project | user click on a volunteer's link from a list, click a "add a project" button, selects a project from a dropdown list, and clicks the "confirm" button | the user is added to the project in the database and a confirmation is shown to the user on the page |
| The app allows the user to view all the volunteers associated with a specific project | user clicks on a project's link from a list | a new page displays the project title and all volunteers associated with it |

## Essential User Stories

* As a non-profit employee, I want to view, add, update and delete projects.
* As a non-profit employee, I want to view, add, update and delete volunteers.
* As a non-profit employee, I want to add volunteers to a project.

## Authors

* Dominic Brown

## License

Copyright © 2017 **_Dominic Brown_**
