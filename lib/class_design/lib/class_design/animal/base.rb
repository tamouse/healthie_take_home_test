# frozen_string_literal: true

module ClassDesign
  module Animal
    # Base class to handle commonalities
    class Base
      def likes(_food)
        raise NotImplementedError, 'Descendants must define this method'
      end

      def eat(food)
        if likes(food)
          3.times.map { speak }.join(', ')
        else
          speak
        end
      end

      def speak
        raise NotImplementedError, 'Descendants must define this method'
      end
    end
  end
end
