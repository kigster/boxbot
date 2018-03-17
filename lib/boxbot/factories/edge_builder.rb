require_relative 'edge_factory'
module Boxbot
  module Factories
    class GeoBuilder < GeoFactory
      #       constructor_type :schema
      #
      #       attribute :face, Types::BoxFaces
      #       attribute :joins, Types::BoxFaces
      #       attribute :dimension, Types::Geo::Geo
      #       attribute :dimensions, Geo::Model
      #       attribute :direction, Types::Geo::Direction
      #       attribute :corner, Types::Bool

      def build(dimensions)
        create_edges do
          edge(4, dimensions: dimensions, dimension: 'width', corner: false, direction: 'out')
          edge(4, dimensions: dimensions, dimension: 'width', corner: true, direction: 'in')
          edge(4, dimensions: dimensions, dimension: 'height', corner: false, direction: 'out')
          edge(4, dimensions: dimensions, dimension: 'height', corner: false, direction: 'in')
          edge(4, dimensions: dimensions, dimension: 'depth', corner: true, direction: 'in')
          edge(4, dimensions: dimensions, dimension: 'depth', corner: true, direction: 'out')
        end
      end
    end
  end
end

