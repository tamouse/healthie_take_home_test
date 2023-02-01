# README

# Take home test for Healthie job application

From the email:

## Short answer ##

Answer with something like 1–4 sentences. We aren't looking for a precise technical definition. Answer in a way that you think is relevant to your software engineering work. If you don't know an answer, don't copy/paste from the web - just give whatever info you know.

  * What is HTML?
  * What is CSS?
  * What is the DOM?
  * What is memory?
  * What is TCP/IP?
  * In a programming language, what is a class?
  * In a database, what is a foreign key?
  * What is Model View Controller?
 
## Coding ##

For these challenges, you may write any code you wish in order to implement your answer. Please provide code in a runable file, with some instructions in comments at the top for how to run it.
 
### Prime Number Finder ###

Write a function that looks for prime numbers for a certain amount of time. When that amount of time has elapsed, it prints the largest prime number it found, and then returns nil. invoked like this to run for 5 seconds: find_prime_number(5)

### Class design ###

Create classes Cat, Dog, Chicken, CatFood, DogFood, HumanFood, Lemons

  * a cat likes CatFood, Chicken, and Milk
  * a dog likes DogFood, CatFood, Chicken, HumanFood
  * a Cat can meow and a Dog can bark (print "meow" or "bark" to STDOUT)
  * when an animal eats food it likes, it makes a noise three times
  * when an animal eats food it dislikes, it makes a noise one time
  * You can implement this any way you like, with whatever api you think makes sense.

Include a driver file which requires the files, instantiates the classes, and invokes the methods to demonstrate the functionality.

### Database and model design with queries ###

We want to model providers (e.g. dietitians), their clients, and journal entries.

  * Both providers and clients have a name and an email address.
  * Providers have many clients
  * Clients usually have one Provider but can have more than one.
  * Clients have a plan that they paid for, signified by the string "basic" or "premium". For each provider that a client is signed up with, they have 1 plan.
  * Clients post journal entries. These consist of freeform text.
 
We want to be able to do these queries:

  * Find all clients for a particular provider
  * Find all providers for a particular client
  * Find all of a particular client's journal entries, sorted by date posted
  * Find all of the journal entries of all of the clients of a particular provider, sorted by date posted
 
Using ActiveRecord, Django, or another system you enjoy using, create the classes and schema migrations for this, including indexes.
 
Show how to do each of the queries listed above.
 
If you are torn between multiple approaches, just choose one to implement and explain the other approach and what the pros and cons of each might be.

# Notes on answering the take home test #

## Structure ##

As the final set of questions fit best into using Ruby on Rails, I decided to create a very minimal API-based rails repo, to which I can supply the answers to test quesitons.

# Setting up this repo for examination of answers #

## Versions used ##

  * Ruby: 3.1.1
  * Bundler: 2.3.26
  * Rails: 7.0.4.2

## System dependencies ##

  * SQLite database system, for demo purposes only
  * ActiveSupport::TestCase and others bundled with Rails, i.e., no RSpec

## Configuration ##

  * Development configuation should all be fine for evaluation purposes.
  * Run `bin/rails db:setup` (or `bin/rails db:reset` if database files already exist) to (re-)create a populated dev environment

## Starting the server ##

  * Run `bin/rails server` to bring up the server
  * Run `open http://localhost:3000/` to get a verification the server is running

## How to run the test suite ##

  * Tests are run using `bin/rails test`

