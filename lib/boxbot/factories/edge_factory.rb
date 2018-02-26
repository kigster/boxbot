module Boxbot
  module Factories
    class EdgeFactory
      attr_accessor :current_edge, :edge_list, :edge_set

      extend Forwardable
      def_delegators :@edge_list, :each, :size, :[]

      include Enumerable

      def initialize
        self.current_edge = nil
        reset_edges
      end

      def outward
        self.current_edge.direction = 'out'
      end

      def inward
        self.current_edge.direction = 'in'
      end

      def corner
        self.current_edge.corner = true
      end

      def edge(count = 1, dim, &block)
        count.times do
          make_edge(dim, &block)
        end
      end

      def create_edges
        reset_edges
        yield if block_given?
        edges
      end

      def <<(edge)
        self.edge_set << edge
        self.edge_list << edge
      end

      alias :[]= :<<

      private

      def reset_edges
        self.edge_set = Set.new
        self.edge_list = Array.new

      end

      def make_edge(dim, &block)
        self.current_edge = Edge.new(dimension: dim.to_s)
        self.current_edge.instance_eval(&block) if block
        self.<< self.current_edge if self.current_edge
      end

    end
  end
end
