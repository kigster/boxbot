require_relative 'model'
require_relative 'transactions/container'

module Boxbot
  module Edge
    Transaction = Dry::Transaction(container: Transactions::Container)
  end
end

require_relative 'transactions/operations/define'
require_relative 'transactions/operations/kerf'
require_relative 'transactions/operations/move'
require_relative 'transactions/operations/rotate'

require_relative 'transactions/container'
require_relative 'transactions/create'

