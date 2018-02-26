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

          def call(input)
            if input.is_a?(Hash) && input[:dimensions].is_a?(Boxbot::Dimensions)
              Success(Boxbot::Edge.new(**input))
            else
              Failure("Invalid input parameter #{input}")
            end
          end
        end
      end
    end
  end
end
