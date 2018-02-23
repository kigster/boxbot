require 'dry-types'
require 'dry-struct'
require 'uri'

module Boxbot
  module Types

    include ::Dry::Types.module

    BoxFaces = String.enum *%w[
      top
      bottom
      left
      right
      front
      back
    ]

    EdgeDirection = String.enum *%w[
      out
      in
    ]

    Dimensions = String.enum *%w[
      width
      height
      depth
    ]

  end
end
