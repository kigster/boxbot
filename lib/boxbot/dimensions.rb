require 'dry-struct'
require 'dry-types'
require 'boxbot/types'

module Boxbot
  class Dimensions < Dry::Struct
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
