# frozen_string_literal: true

require 'test_helper'

module ClassDesign
  module Animal
    class TestBase < Minitest::Test
      def test_likes_raises_NotImplemented
        animal = ::ClassDesign::Animal::Base.new
        assert_raises(NotImplementedError) { animal.likes(:food) }
      end

      def test_speak_raises_NotImplements
        animal = ::ClassDesign::Animal::Base.new
        assert_raises(NotImplementedError) { animal.speak }
      end
    end
  end
end
