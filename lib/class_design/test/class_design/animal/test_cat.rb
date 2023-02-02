# frozen_string_literal: true

module ClassDesign
  module Animal
    class TestCat < Minitest::Test
      def setup
        @fluffy = ::ClassDesign::Animal::Cat.new
      end

      def test_cat_likes_cat_food
        assert @fluffy.likes(Food::CatFood)
      end

      def test_cat_likes_chicken
        assert @fluffy.likes(Food::Chicken)
      end

      def test_cat_likes_milk
        assert @fluffy.likes(Food::Milk)
      end

      def test_cat_hates_dog_food
        refute @fluffy.likes(Food::DogFood)
      end

      def test_cat_hates_human_food
        refute @fluffy.likes(Food::HumanFood)
      end

      def test_cat_hates_lemons
        refute @fluffy.likes(Food::Lemon)
      end

      def test_a_cat_says_meow
        assert_equal "meow", @fluffy.speak
      end
    end
  end
end
