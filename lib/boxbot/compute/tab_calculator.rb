require 'dry-struct'
require 'dry-types'
require 'boxbot/types'

module Boxbot
  module Compute
    TabWidthResult = Struct.new(:dimension, :length, :tab_count, :tab_width)

    MAX_TAB_COUNT = (ENV['BOXBOT__MAX_TAB_COUNT'] || '99').to_i
    #
    # TabWithCalculator
    #
    # Computes the actual tab with for a given dimension index or name.
    #
    # Usage:
    #
    #     Boxbot::Compute::TabCalculator.new(dimensions)['height']
    #     # => 9
    #
    class TabCalculator
      attr_accessor :dimensions

      def initialize(dimensions)
        self.dimensions = dimensions
      end

      def [](dimension_identifier)
        tab_count_for_length(
          dimension_length(
            dimension_identifier
          )
        )
      end

      def calculate(dimension_identifier)
        index     = resolve_dimension_argument(dimension_identifier)
        length    = dimensions.inner_box[index]
        tab_count = tab_count_for_length(length)
        tab_width = length / tab_count

        TabWidthResult.new(Types::Dimensions[index],
                           length,
                           tab_count,
                           tab_width)
      end

      private

      def dimension_length(dimension_identifier)
        index = resolve_dimension_argument(dimension_identifier)
        dimensions.inner_box[index]
      end

      def tab_count_for_length(length)
        return nil unless length
        tab_count = (length / dimensions.tab_width).to_i
        if tab_count > MAX_TAB_COUNT
          MAX_TAB_COUNT
        elsif tab_count < 3
          3
        elsif tab_count.even?
          tab_count + 1
        else
          tab_count
        end
      end

      private
      def resolve_dimension_argument(dimension_identifier)
        index = case dimension_identifier
                  when Numeric
                    dimension_identifier
                  when String, Symbol
                    Boxbot::Edge.dimension_index(dimension_identifier.to_s)
                  else
                    raise ArgumentError, "invalid argument type #{dimension_identifier.class}"
                end
      end
    end
  end
end
