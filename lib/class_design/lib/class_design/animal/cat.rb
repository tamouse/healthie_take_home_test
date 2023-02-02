# frozen_string_literal: true

module ClassDesign
  module Animal
    # The Cat class, an implementation of the Base class
    class Cat < Base
      # a cat likes CatFood, Chicken, and Milk
      FOOD_CATS_LIKE = [
        ClassDesign::Food::CatFood,
        ClassDesign::Food::Chicken,
        ClassDesign::Food::Milk
      ].freeze

      def likes(food)
        FOOD_CATS_LIKE.include? food
      end

      def speak
        'meow'
      end
    end
  end
end
