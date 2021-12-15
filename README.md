# README

This README would normally document whatever steps are necessary to get the
application up and running.

- Ruby version an Rails version
  This project uses ruby version 3.0.3, and Rails version 6.1.4.1

- Database creation
  You can use any database of your choice, for this project, we have configured it to work with MySQL

- Database initialization
  Please create a MySQL database in xampp's php-myadmin called `fundapi`

- How to run the test suite
  To run all tests, run this command in the terminal:
  `rspec`

- Deployment instructions
  To install this project on your local machine, follow the instructions below:

1. Clone the repo using the command: `git clone https://github.com/livingstonex/fund-api.git`
2. Run: `bundle install` This would install the dependencies of the app
3. Set up a database of your choice. The project uses MySQL, so if you decide to use MySQL, you'll have setup a xampp server and create a database named: `fundapi`
4. Start up the server by running the command: `rails s -p 4000`
