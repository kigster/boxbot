require 'dry-struct'
require 'dry-types'
require 'boxbot/types'
require 'boxbot/box_dimensions'
module Boxbot
  class Edge < Dry::Struct
    constructor_type :schema

    attribute :face, Types::BoxFaces
    attribute :joins, Types::BoxFaces
    attribute :dimension, Types::Dimensions
    attribute :dimensions, BoxDimensions
    attribute :direction, Types::EdgeDirection

    def initialize(*args, &block)
      super(*args, &block)
    end

    def dimension_index
      self.class.dimension_index(dimension)
    end

    def self.dimension_index(dim)
      Types::Dimensions.values.find_index(dim)
    end

  end

end
