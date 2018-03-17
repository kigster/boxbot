require 'dry-container'
require 'dry/transaction'
require 'dry/transaction/operation'

require 'boxbot/geo/edge'

module Boxbot
  module Transactions
    module Operations
      class Define
        include Dry::Transaction::Operation

        def call(edge)
          if edge.kind_of?(::Boxbot::Geo::Edge) # && edge.dimensions.is_a?(Boxbot::Geo)
            Success(edge)
          else
            Failure("Error in #Define: expecting an edge, got: #{edge}")
          end
        end
      end
    end
  end
end
