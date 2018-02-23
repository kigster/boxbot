require 'dry-struct'
require 'dry-types'
require 'boxbot/types'

module Boxbot

  # Holds the internal dimensions of the box, including
  # laser-specific parameters such as kerf and material thickness.
  #
  # @author Konstantin Gredeskoul
  #
  # @attr [Float] width
  # @attr [Float] height
  # @attr [Float] depth
  # @attr [Float] kerf
  # @attr [Float] thickness
  # @attr [Float] tab desired tab width/length used as a guide
  #
  # @example compute number of tabs for the vertical dimension
  #     dim = Boxbot::Dimension.new(width: 10, height: 2, depth: 3, ...)
  #     dim.inner_box # => [ 10, 2, 3 ]
  #
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

    # Returns dimensions of the inner box.
    # @return [Array<Integer>] three dimensional array of width, height, depth
    def inner_box
      [width, height, depth]
    end

    # Returns dimensions of the outer box by adding thickness to the inner box.
    # @return [Array<Integer>] three dimensional array of width, height, depth
    def outer_box
      inner_box.map { |d| o(d) }
    end

    # Returns dimensions of the outer box with kerf added.
    # @return [Array<Integer>] three dimensional array of width, height, depth
    def outer_box_with_kerf
      inner_box.map { |d| o(d, add_kerf: true) }
    end

    # Returns either provided or the default tab width.
    # The default is computed as `4 x thickness.`
    # @return [Float] tab width
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
