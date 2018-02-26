require_relative 'edge_factory'
module Boxbot
  module Factories
    class EdgeBuilder < EdgeFactory
      def build
        create_edges do
          edge(4, :height) { outward }
          edge(4, :height) { outward }

          edge(4, :depth) { outward; corner }
          edge(4, :depth) { inward; corner }

          edge(4, :width) { outward }
          edge(4, :width) { inward; corner }
        end
      end
    end
  end
end

