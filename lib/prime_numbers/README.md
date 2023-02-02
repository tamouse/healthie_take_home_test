# PrimeNumbers

Write a function that looks for prime numbers for a certain amount of time. When that amount of time has elapsed, it prints the largest prime number it found, and then returns nil. invoked like this to run for 5 seconds: find_prime_number(5)

## Implementation Notes ##

Instead of trying to write an algorithm for finding primes that I haven't looked at in 40 years, I went with the (formerly StdLib) gem 'prime'.

Printing a number and returning `nil` really gives me the pains. A function should return a value and we're throwing away all that work instead of giving it to the caller to do something interesting with. I implement the spec under duress. ;D

### Running the function ###

From the Rails application root directory, navigate into the prime numbers gem and install. Then you can run an `./exe/` file to see the results:

``` shell
cd ./lib/prime_numbers
bundle install
exe/prime_numbers <seconds>...
```

For example:

``` shell
exe/prime_numbers 1 3 5 7 9
```

Outputs:

``` shell

Running for 1 seconds
434807
Real time: 0.44009699998423457
Total time: 0.43978

Running for 3 seconds
2980771
Real time: 2.999884999822825
Total time: 2.999812

Running for 5 seconds
4934773
Real time: 4.999923000112176
Total time: 4.9991639999999995

Running for 7 seconds
6891193
Real time: 6.9999469998292625
Total time: 6.9988

Running for 9 seconds
8872483
Real time: 8.999938999768347
Total time: 8.998187999999999

```



