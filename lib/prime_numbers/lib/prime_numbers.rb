# frozen_string_literal: true

require_relative "prime_numbers/finder"
require_relative "prime_numbers/version"

module PrimeNumbers
  class Error < StandardError; end

  def self.find_prime_number(seconds)
    PrimeNumbers::Finder.new.find_prime_number(seconds)
  end
end
