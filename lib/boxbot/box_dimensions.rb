require 'dry-struct'
require 'dry-types'
require 'boxbot/types'

module Boxbot
  class BoxDimensions < Dry::Struct
    constructor_type :schema

    attribute :width, Types::Strict::Float
    attribute :height, Types::Strict::Float
    attribute :depth, Types::Strict::Float
    attribute :kerf, Types::Strict::Float
    attribute :thickness, Types::Strict::Float
    attribute :tab, Types::Strict::Float.optional

    def initialize(*args, &block)
      super(*args, &block)
      self.kerf ||= 0
    end

    MAX_TAB_COUNT = 99

    # @param [Integer, String] dimension either name or index [0..2]
    def number_of_tabs_for(dimension_index_or_name)
      index     = case dimension_index_or_name
                    when Numeric
                      dimension_index_or_name
                    when String, Symbol
                      Edge.dimension_index(dimension_index_or_name.to_s)
                    else
                      raise ArgumentError, "invalid argument type #{dimension_index_or_name.class}"
                  end
      length    = inner_box[index]
      tab_count = (length / tab_width).to_i
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

    def inner_box
      [width, height, depth]
    end

    def outer_box
      inner_box.map { |d| o(d) }
    end

    def outer_box_with_kerf
      inner_box.map { |d| o(d, add_kerf: true) }
    end

    def tab_width
      raise ArgumentError, 'Thickness is zero?' if thickness.zero?
      tab ? tab : thickness * 4
    end

    private

    def o(attr, add_kerf: false)
      attr + 2 * thickness + (add_kerf ? 2 * kerf : 0)
    end

  end
end
