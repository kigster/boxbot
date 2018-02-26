require 'dry-container'
require 'dry/transaction'
require 'dry/transaction/operation'

require 'boxbot/dimensions/model'

module Boxbot
  module Edge
    module Transactions
      module Operations
        class Notch
          include Dry::Transaction::Operation

          def call(input)
            if input.is_a?(Boxbot::Edge)
              # TODO: create a first set of point tuples
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