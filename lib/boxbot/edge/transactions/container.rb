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
          ops.register 'define' do
            Operations::Define.new
          end

          ops.register 'notch' do
            Operations::Notch.new
          end

          ops.register 'kerf' do
            Operations::Kerf.new
          end

          ops.register 'rotate' do
            Operations::Rotate.new
          end

          ops.register 'move' do
            Operations::Move.new
          end
        end
      end
    end
  end
end
