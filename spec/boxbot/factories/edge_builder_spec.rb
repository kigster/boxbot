require 'spec_helper'

RSpec.describe Boxbot::Factories::GeoBuilder do
  include_examples 'settings-5x4x3'
  subject(:eb) { described_class.new }
  describe '#build' do
    before { eb.build(settings_5x4x3) }
    its(:size) { should eq 24 }
  end
end
