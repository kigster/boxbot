require 'boxbot/version'
require 'dry-types'

Dry::Types.load_extensions(:maybe)

require 'boxbot/types'
require 'boxbot/settings'
require 'boxbot/geo/edge'
require 'boxbot/transactions/edge_transaction'

require 'boxbot/compute/tab_calculator'

require 'boxbot/factories/edge_factory'
require 'boxbot/factories/edge_builder'

# Main namespace for the Boxbot library.
#
# The library aims to create a way to generate laser-cutter cut templates
# as easily as possible, while keeping the sides symmetric.
#
# @see https://github.com/kigster/boxbot
# @author Konstantin Gredeskoul
module Boxbot
end
