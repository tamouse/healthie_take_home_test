# frozen_string_literal: true

module ClassDesign
  module Animal
    # The Dog class, an implementation of the Animal Base class
    class Dog < Base
      # a dog likes DogFood, CatFood, Chicken, HumanFood
      FOOD_DOGS_LIKE = [
        ClassDesign::Food::CatFood,
        ClassDesign::Food::Chicken,
        ClassDesign::Food::DogFood,
        ClassDesign::Food::HumanFood
      ].freeze

      def likes(food)
        FOOD_DOGS_LIKE.include? food
      end

      def speak
        'bark'
      end
    end
  end
end
