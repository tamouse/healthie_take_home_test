# ClassDesign

Implement the Class Design section of the Coding Take Home Test:

Create classes Cat, Dog, Chicken, CatFood, DogFood, HumanFood, Lemons

  * a cat likes CatFood, Chicken, and Milk
  * a dog likes DogFood, CatFood, Chicken, HumanFood
  * a Cat can meow and a Dog can bark (print "meow" or "bark" to STDOUT)
  * when an animal eats food it likes, it makes a noise three times
  * when an animal eats food it dislikes, it makes a noise one time
  * You can implement this any way you like, with whatever api you think makes sense.

Include a driver file which requires the files, instantiates the classes, and invokes the methods to demonstrate the functionality.

## Implementation Notes ##

1. Created two parent classes, Animal and Food.
2. Created the class Lemon, singular instead of plural.
3. Created a class for Milk in addition.
4. Tests exercise the Animal classes.
5. The file `./exe/class_design` drives the classes demonsrtrating the specs.

## Initializing ##

Navigate the terminal to the `./lib/class_design/` folder from the Rails root. It's a self-contained gem.

From that point, you can run the tests with:

``` shell
rake TEST_OPTS='--verboze'
# I like to see the test cases instead of a bunch of dots
```

In the same folder, run the driver:

``` shell
exe/class_design
```

which givdes a more human understanding of what's happening.
