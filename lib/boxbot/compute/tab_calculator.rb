require 'dry-struct'
require 'dry-types'
require 'boxbot/types'

module Boxbot
  module Compute

    # Holds the result of Tab Width Computation.
    #
    # @attr [String] dimension name
    # @attr [Float] length the length of the dimension
    # @attr [Integer] tab_count the total number of tabs along this dimension
    # @attr [Float] tab_width length of each tab without the kerf adjustment
    #
    TabWidthResult = Struct.new(:dimension, :length, :tab_count, :tab_width)

    MAX_TAB_COUNT = (ENV['BOXBOT__MAX_TAB_COUNT'] || '99').to_i

    # Computes the actual tab with for a given dimension index or name.
    #
    # @author Konstantin Gredeskoul
    # @attr [Boxbot::Dimensions] dimensions instance
    #
    # @example compute number of tabs for the vertical dimension
    #     dim = Boxbot::Dimension.new(width: 10, ... )
    #     Boxbot::Compute::TabCalculator.new(dim)['height']
    #     # => 9
    #
    class TabCalculator
      attr_accessor :dimensions

      def initialize(dimensions)
        self.dimensions = dimensions
      end

      # Computes the tab width for a given dimension, and returns
      # a TabWithResult struct.
      #
      # @param dimension_identifier [Symbol,String,Integer] A name, symbol
      #   or an integer index of one of 3 dimensions.
      #   Can be 'width' or 0, 'height' or 1, 'depth' or 2
      #
      # @return [TabWidthResult] struct with tab width, count and length
      # @raise ArgumentError if argument is not a String, Symbol, or Integer.
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

      # Computes the tab count for a given dimension, and returns
      # an integer result.
      #
      # @param (see #calculate)
      # @return [Integer] Number of tabs along this dimension
      # @raise ArgumentError if argument is not a String, Symbol, or Integer.
      def [](dimension_identifier)
        tab_count_for_length(
          dimension_length(
            dimension_identifier
          )
        )
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

      def resolve_dimension_argument(dimension_identifier)
        case dimension_identifier
          when Numeric
            dimension_identifier
          when String, Symbol
            Boxbot::Edge::Model.dimension_index(dimension_identifier.to_s)
          else
            raise ArgumentError, "invalid argument type #{dimension_identifier.class}"
        end
      end
    end
  end
end
