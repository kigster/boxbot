require 'dry-struct'
require 'dry-types'
require 'boxbot'

module Boxbot
  module Geo
    class Edge < ::Dry::Struct
      # noinspection RubyResolve
      constructor_type :schema

      attribute :face, Types::BoxFaces
      attribute :joins, Types::BoxFaces
      attribute :dimension, Types::Axis
      attribute :dimensions, ::Boxbot::Settings
      attribute :direction, Types::NotchDirection
      attribute :corner, Types::Bool

      def initialize(*args, &block)
        super(*args, &block)
      end

      # Creates a new instance based on the current, in the process
      # optionally merging new values in.
      # @param [**Hash] values to change while copying
      # @example change direction of of the edge
      #     edge_out = edge.copy_changed(direction: 'in')
      #
      # @returns [Geo]
      def copy_changed(**values)
        self.class.new(**self.to_hash.merge!(values))
      end

      def dimension_index
        self.class.dimension_index(dimension)
      end

      def self.dimension_index(dim)
        Types::Axis.values.find_index(dim)
      end
    end

  end
end



