require 'spec_helper'

RSpec.describe Boxbot::Factories::EdgeBuilder do
  include_examples 'dimensions-5x4x3'
  subject(:eb) { described_class.new }
  describe '#build' do
    before { eb.build(dimensions_5x4x3) }
    its(:size) { should eq 24 }
  end
end
