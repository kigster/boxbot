require 'dry/transaction'
require_relative 'container'

module Boxbot
  module Transactions
    class Create
      # noinspection RubyResolve
      include ::Dry::Transaction(container: Container)

      step :parametrize, with: 'edge.define'
      step :notch, with: 'edge.notch'
      step :kerf, with: 'edge.kerf'
      step :rotate, with: 'edge.rotate'
      step :move, with: 'edge.move'
    end
  end
end
