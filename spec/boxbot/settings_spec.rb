require 'spec_helper'

RSpec.describe Boxbot::Settings do
  include_examples 'settings-5x4x3'
  subject(:dims) { settings_5x4x3 }

  its(:height) { should eq 4 }
  its(:width) { should eq 5.0 }
  its(:tab) { should be_nil }
  its(:inner_box) { should eq [5.0, 4, 3] }
  its(:outer_box) { should eq [5.25, 4.25, 3.25] }

  context 'with tab' do
    let(:tab_override) { 0.5 }
    its(:tab) { should eq 0.5 }
  end

  context 'with kerf' do
    let(:kerf) { 0.01 }
    its(:outer_box) { should eq [5.25, 4.25, 3.25] }
    its(:outer_box_with_kerf) { should eq [5.27, 4.27, 3.27] }
  end
end
