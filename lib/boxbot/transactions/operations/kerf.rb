require 'dry-container'
require 'dry/transaction'
require 'dry/transaction/operation'

require 'boxbot/geo/edge'

module Boxbot
  module Transactions
    module Operations
      class Kerf
        include Dry::Transaction::Operation

        def call(input)
          if input.is_a?(Boxbot::Geo::Edge)
            Success(input)
          else
            Failure("Invalid input parameter #{input}")
          end
        end
      end
    end
  end
end
