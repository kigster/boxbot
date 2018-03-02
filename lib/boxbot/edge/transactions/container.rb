require 'dry-container'

require_relative 'operations/define'
require_relative 'operations/notch'
require_relative 'operations/kerf'
require_relative 'operations/rotate'
require_relative 'operations/move'

module Boxbot
  module Edge
    module Transactions
      class Container
        extend Dry::Container::Mixin

        namespace 'edge' do |ops|
          ops.register('define') { Operations::Define.new }
          ops.register('notch') { Operations::Notch.new }
          ops.register('kerf') { Operations::Kerf.new }
          ops.register('rotate') { Operations::Rotate.new }
          ops.register('move') { Operations::Move.new }
        end
      end
    end
  end
end
