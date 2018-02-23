require 'spec_helper'
require_relative '../support/dimensions'

RSpec.describe Boxbot::Edge do
  include_examples 'dimensions-5x4x3'

  let(:face) { 'top' }
  let(:joins) { 'front' }
  let(:dimension) { 'width' }
  let(:direction) { 'out' }

  let(:edge_params) do
    {
      face:             face,
      joins:            joins,
      dimension:        dimension,
      inner_dimensions: dimensions_5x4x3,
      direction:        direction
    }
  end

  subject(:edge) { described_class.new(**edge_params) }

  its(:face) { should eq 'top' }
  its(:joins) { should eq 'front' }
  its(:dimension) { should eq 'width' }
  its(:dimension_index) { should eq 0 }
  its(:inner_dimensions) { should eq dimensions_5x4x3 }
  its(:direction) { should eq 'out' }
end
