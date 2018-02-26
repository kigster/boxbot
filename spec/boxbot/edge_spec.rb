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
      face:       face,
      joins:      joins,
      dimension:  dimension,
      dimensions: dimensions_5x4x3,
      direction:  direction
    }
  end

  subject(:edge) { described_class.new(**edge_params) }

  describe 'attributes' do
    its(:face) { should eq 'top' }
    its(:joins) { should eq 'front' }
    its(:dimension) { should eq 'width' }
    its(:dimension_index) { should eq 0 }
    its(:dimensions) { should eq dimensions_5x4x3 }
    its(:direction) { should eq 'out' }
  end

  describe '#copy_changed' do
    before { expect(edge.direction).to eq 'out' }
    subject(:edge1) { edge.copy_changed(direction: 'in') }
    its(:direction) { should eq 'in' }
  end
end
