module Boxbot
  module Factories
    class EdgeFactory
      attr_accessor :edge_list, :edge_set
      attr_writer :current_edge

      extend Forwardable
      def_delegators :@edge_list, :each, :size, :[]

      include Enumerable

      def initialize
        reset!
      end

      def reset!
        self.edge_set  = Set.new
        self.edge_list = Array.new
        self.current_edge = nil
      end

      def flush!
        self.<< self.current_edge if self.current_edge
        self.current_edge = nil
      end

      def create_edge(**args)
        self.current_edge = Edge::Model.new(**args)
      end

      def current_edge(**args)
        @current_edge ||= Edge::Model.new(**args)
      end

      def outward
        self.current_edge = current_edge.copy_changed(direction: 'out')
      end

      def inward
        self.current_edge = current_edge.copy_changed(:direction, 'in')
      end

      def corner
        self.current_edge.corner = true
      end

      def edge(count = 1, **args, &block)
        count.times do
          make_edge(**args, &block)
        end
      end

      def create_edges(&block)
        reset!
        self.instance_exec(&block)
        edge_list
      end

      def <<(edge)
        self.edge_set << edge
        self.edge_list << edge
      end

      alias :[]= :<<

      private


      def make_edge(**args, &block)
        flush!
        create_edge(**args)
        self.instance_exec(&block) if block
      end

    end
  end
end
