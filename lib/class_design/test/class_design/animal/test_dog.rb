# frozen_string_literal: true

module ClassDesign
  module Animal
    class TestDog < Minitest::Test
      def setup
        @fido = ::ClassDesign::Animal::Dog.new
      end

      def test_cat_likes_cat_food
        assert @fido.likes(Food::CatFood)
      end

      def test_cat_likes_chicken
        assert @fido.likes(Food::Chicken)
      end

      def test_cat_hates_milk
        refute @fido.likes(Food::Milk)
      end

      def test_cat_likes_dog_food
        assert @fido.likes(Food::DogFood)
      end

      def test_cat_likes_human_food
        assert @fido.likes(Food::HumanFood)
      end

      def test_cat_hates_lemons
        refute @fido.likes(Food::Lemon)
      end

      def test_a_cat_says_meow
        assert_equal 'bark', @fido.speak
      end
    end
  end
end
