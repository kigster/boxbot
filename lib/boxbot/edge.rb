require 'dry-struct'
require 'dry-types'
require 'boxbot/types'
require 'boxbot/inner_dimensions'
module Boxbot
  class Edge < Dry::Struct
    constructor_type :schema

    attribute :face, Types::BoxFaces
    attribute :joins, Types::BoxFaces
    attribute :dimension, Types::Dimensions
    attribute :inner_dimensions, InnerDimensions
    attribute :direction, Types::EdgeDirection

    def initialize(*args, &block)
      super(*args, &block)
    end

    def dimension_index
      Types::Dimensions.values.find_index(dimension)
    end

  end

end
