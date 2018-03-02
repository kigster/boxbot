require 'dry-container'
require 'dry/transaction'
require 'dry/transaction/operation'

require 'boxbot/dimensions/model'

module Boxbot
  module Edge
    module Transactions
      module Operations
        class Define
          include Dry::Transaction::Operation

          def call(edge)
            if edge.kind_of?(::Boxbot::Edge::Model) # && edge.dimensions.is_a?(Boxbot::Dimensions)
              Success(edge)
            else
              Failure("Error in #Define: expecting an edge, got: #{edge}")
            end
          end
        end
      end
    end
  end
end
