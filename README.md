# README

## tl;dr ##

Install dependencies however you do that.

Grab the zip from github at <https://github.com/tamouse/healthie_take_home_test/archive/refs/heads/main.zip> and save the download somewhere.

``` shell
mkdir -p tmp
cd tmp
unzip path/to/healthie_take_home_test-main.zip
cd healthie_take_home_test

git init
bin/setup
bin/rails db:seed

bin/rails db:environment:set RAILS_ENV=test
bin/rails test

# Coding part 1: prime numbers
cd lib/prime_numbers
bin/setup
exe/prime_numbers 1 3 5 7 9
cd -

# Coding part 2: class design
cd lib/class_design
bin/setup
exe/class_design 
cd -

# Coding part 3: database and model design
bin/rails runner ./scripts/queries_for_tht.rb
```

# Setting up this repo for examination of answers #

## Versions used ##

  * Ruby: 3.1.1
  * Bundler: 2.3.26
  * Rails: 7.0.4.2

## System dependencies ##

  * SQLite database system, for demo purposes only
  * ActiveSupport::TestCase and others bundled with Rails, i.e., no RSpec
  
## Installation ##

Either unzip the repo archive or clone the repo to a working directory and run setup:

### Zip archive ###

``` shell
mkdir -p tmp
cd tmp
unzip path/to/healthie_take_home_test.zip
cd healthie_take_home_test
```

### Git clone ###

``` shell
mkdir -p tmp
cd tmp
git clone https://github.com/tamouse/healthia_take_home_test.git
```

## Initializing the repo ##

In the zip version, there is no `./.git` directory, and things complain less if there is one, so first thing we need to do is initialize git.

``` shell
cd healthie_take_home_test
git init
bin/setup
bin/rails db:seed
```

## Configuration ##

The development configuation should all be fine for evaluation purposes.

There are no controllers for this app, so there's no need to start the rails server.

## Running Queries ##

There is a runner devoted to executing the required queries:

``` shell
bin/rails runner ./scripts/queries_for_tht.rb
```

## Testing ##

Tests are run using `bin/rails test`
  
``` shell
bin/rails db:environment:set RAILS_ENV=test
bin/rails test
```
  
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
  
### What is HTML? ###

HTML stands for "HyperText Markup Language" and is a declarative language for marking up *content* on a web page so the browser can determine *what* the structure of the content is.

### What is CSS? ###

CSS stands for "Cascading Style Sheets" and is declarative language a browser uses for determining the appearance of the HTML content. The cascading part of the name indicates that the formatting rules are inherited fromr rules with more specificity.

### What is the DOM? ###

DOM stands for "Document Object Model" which is determined by converting the HTML and CSS rules into syntax tree with properties that can be manipulated via JavaScript.

### What is memory? ###

Memory is how a computer keeps track of information it's operating upon, or which has been persisted in some way. There are different classes of memory including fast level 1 and level 2 cache which is held on the CPU (Computer Processing Unit), to RAM in the system, today typically measured in Gigabites, on to local disk / storage, remote storage, and cloud storage.

### What is TCP/IP? ###

The standard way applications running on differnt computers communicate. TCP is "Transmission Control Protocol" and deals with making sure information transmission is in the proper order and is reliably transmitted from end to end. IP is "Internet Protocol" and deals with assembling and disassembling smaller, well-known sized packets of information, however is designed to continue operating in an unreliable environment.

### In a programming language, what is a class? ###

For Object Oriented programming languages, a *class* is a definition (template, prototype, etc) for creating instances, *objects*, that carry out the programming instructions. In several OO langs, classes can inherit from other classes, making definition of classes both less complex in the number of methods needing to be defined, and more complex in the number of inherited classes.

### In a database, what is a foreign key? ###

A foreign key is a *constrained* way of tying a dependent table to an independent table. The foreign key contraints provide considerable protect of data integrity.

### What is Model View Controller? ###

The collection of architecture patterns that define the workings of a modern 3-tier web applicaiton. (E.g. Rails, Django, Sails)

1. The Controller receives requests from a client, often a browser on a human user's computer, and provides a response after processing the request.
2. The Views are templates and instructions for detailed assembly of the content that is returned in the respionse the Controller gives.
3. The Model consists of operating instructions to deal with persistence, calculations, background work, i.e., anything that's not handled in Controllers and Views. Persistence Models are tied to a backing database or datastore. Other models can be pure funcitonality.



## Coding ##

For these challenges, you may write any code you wish in order to implement your answer. Please provide code in a runable file, with some instructions in comments at the top for how to run it.
 
### Prime Number Finder ###

Write a function that looks for prime numbers for a certain amount of time. When that amount of time has elapsed, it prints the largest prime number it found, and then returns nil. invoked like this to run for 5 seconds: find_prime_number(5)

> **NOTE:** Find the implementation at `./lib/prime_numbers/` of the Rails root directory. There is a [README](./lib/prime_numbers/README.md) in that directory explaining more about the implementation,

### Class design ###

Create classes Cat, Dog, Chicken, CatFood, DogFood, HumanFood, Lemons

  * a cat likes CatFood, Chicken, and Milk
  * a dog likes DogFood, CatFood, Chicken, HumanFood
  * a Cat can meow and a Dog can bark (print "meow" or "bark" to STDOUT)
  * when an animal eats food it likes, it makes a noise three times
  * when an animal eats food it dislikes, it makes a noise one time
  * You can implement this any way you like, with whatever api you think makes sense.

Include a driver file which requires the files, instantiates the classes, and invokes the methods to demonstrate the functionality.

> **NOTE:** The implementation is in `./lib/class_design/` and there is a [README](./lib/class_design/README.md) in that folder with a bit more info.

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

#### Displaying the queries ####

``` shell
bin/rails runner scripts/queries_for_tht.rb 
```

# Notes on answering the take home test #

## Structure ##

As the final set of questions fit best into using Ruby on Rails, I decided to create a very minimal API-based rails repo, to which I can supply the answers to test quesitons.

## Answers for Coding: Database and model design with queries ##

Since this is a legit ActiveRecord implementation, I found it easiest to toss up a minimal api Rails app:

    rails new healthie_take_home_test --api --minimal

### Displaying the results ###

I thought a few different ways to demonstrate the queries:

1. Using tests
2. Using a runner
3. Creating controllers

Number 3 was the more complicated, while number 1 would have taken extra work to generate interesting output. Number 2 was the simplest way to show the queries.

> ### NOTE: If you are looking for a controller implementation I'd be happy to implement that, too.

In `./scripts/queries_for_tht.rb` is a Rails runner with methods in a class to show the actual queries as they would be done with ActiveRecord. To run:

``` shell
bin/rails runner scripts/queries_for_tht.rb 
```

### Possible edge cqses with using foreign keys incomplete ###

The data models use foreign keys, which can cause isses, especially with a join table such as `Plan`. 

  * What happens if a provider goes away? 
  * What happens when a provider doesn't have anymore clients?
  * When a client is deleted, the associated journal entries are also deleted, but what happens to the collection on the provider?

I'm leaving these out of the take home test, but I'd still like to talk about them.

One of the most common ways I've seen is to make the items on each side of the foreign key be undelete-able, and instead use some form of "soft delete", in essence the record and it associations remain behind, but the record is marked as with a status or boolean indicating it has been deleted and shouldn't be included in any further activity in the app.

This requires either a gem or internally supported code to manage these checks.

Sometimes, especially when you have a table that's huge and / or is the main table in the database, it's easier to just use standard indexes for associations (easier: takes less application effort to add or remove dependent and independent records). However, that's a bad practice or a code smell -- foreign keys are really the way to go, even though it requires more planning to handle all the possible cases. Modern Rails (6+) has gotten better support for foreign keys with PostGresql databases as well.

### The Plan model is poorly named ###

The join table should have a more Rails-ish join table name, such as `ClientsProvidersPlan` instead of just plan.

One might suspect in an actual implementation that plans would warrant their own model, to keep description, price, and associated details of the plan. Then the join record would only need:

    belongs_to :client
    belongs_to :plan 
    belongs_to :provider

