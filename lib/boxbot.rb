require 'boxbot/version'
require 'dry-types'

Dry::Types.load_extensions(:maybe)

module Boxbot
end

require 'boxbot/types'
require 'boxbot/inner_dimensions'
require 'boxbot/edge'



