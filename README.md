# INSPIRE
https://inspire-288.herokuapp.com/

INSPIRE provides recommendations in the form of music, movies, shows, books, authors or games, based on user "interests". A logged in user can add interests, and then simply press the "Inspire Me" button on the home page to get a single recommendation. The recommendation is provided by the TasteDive API.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

From GitHub clone down repository using the following commands in terminal:
```
$ git clone git@github.com:ryan-mcneil/inspire.git
$ cd inspire
```

### Prerequisites

INSPIRE was developed in Rails 5.2 and so we recommend using the same or a more current version of Rails.  The Ruby version used is 2.4

To check your version using terminal run: rails -v in the command line. (use ruby -v to retrieve the ruby version)

If you have not installed rails, in terminal run:
```
$ gem install rails -v 5.2
```

### TasteDive API

To run the application locally, you must apply for a API key [here](https://tastedive.com/read/api).

Once obtained run:
```
$ figaro install
```
and enter `TASTEDIVE_API_KEY: <YOUR KEY>` into the newly created `application.yml` file in `./config`

Now your app can access the API!

### Installing

Open terminal and run these commands:
```
$ bundle
$ rake db:{drop,create,migrate}
$ rails s
```
(this will fire up the development server)

Open up a web browser

Navigate to `/localhost:3000/` to gain access to the INSPIRE landing page.  Once on the landing page, follow the instructions to login or register, then add interests to get recommendations!

## Running the tests

* Note: Before running RSpec, ensure you're in the project root directory.

From the terminal run:
```
$ rspec
```
After RSpec has completed, you should see all tests passing as GREEN.  Any tests that have failed or thrown an error will display RED.  Any tests that have been skipped will be displayed as YELLOW.

## Built With

* Rails
* TasteDive API
* RSpec
* ShouldaMatchers
* Capybara
* Pry
* SimpleCov
* BCrypt
* PostreSQL
* Figaro
* Faraday
* Webmock

## Authors

Ryan McNeil - Github: [ryan-mcneil](https://github.com/ryan-mcneil)
