require 'boxbot/geo/edge'
require_relative 'container'

module Boxbot
  module Geo
    EdgeTransaction = Dry::Transaction(container: Transactions::Container)
  end
end

require_relative 'operations/define'
require_relative 'operations/kerf'
require_relative 'operations/move'
require_relative 'operations/rotate'

require_relative 'container'
require_relative 'create'

