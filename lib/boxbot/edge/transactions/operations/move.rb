require 'dry-container'
require 'dry/transaction'
require 'dry/transaction/operation'
require 'boxbot/dimensions/model'
module Boxbot
  module Edge
    module Transactions
      module Operations
        class Move
          include Dry::Transaction::Operation

          def call(input)
            if input.is_a?(Boxbot::Edge::Model)
              Success(input)
            else
              Failure("Invalid input parameter #{input}")
            end
          end
        end
      end
    end
  end
end
