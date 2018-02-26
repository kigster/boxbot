require_relative 'transactions/container'

module Boxbot
  module Edge
    Transaction = Dry::Transaction(container: Transactions::Container)
  end
end
