# frozen_string_literal: true

require 'prime'

module PrimeNumbers
  class Finder
    def find_prime_number(seconds)
      @quitting_time = Time.now.to_i + seconds
      @last_prime = 2
      @test_number = @last_prime
      while Time.now.to_i < @quitting_time
        @test_number += 1
        if @test_number.prime?
          @last_prime = @test_number
        end
      end

      puts @last_prime
    end
  end
end
