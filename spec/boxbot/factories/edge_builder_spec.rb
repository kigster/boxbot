require 'spec_helper'

RSpec.describe Boxbot::Factories::EdgeBuilder do
  subject(:eb) { described_class.new }
  describe '#build' do
    before { eb.build }
    xit(:size) { should eq 24 }
  end
end
