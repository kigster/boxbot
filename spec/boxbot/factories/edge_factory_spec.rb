require 'spec_helper'

RSpec.describe Boxbot::Factories::EdgeFactory do
  subject(:factory) { described_class.new }
  its(:current_edge) { should be_kind_of(Boxbot::Edge::Model) }
  its(:edge_list) { should be_kind_of(Array) }

  context 'edge' do
    subject(:edges) { factory.edge_list }
    its(:size) { should eq 0 }
    context 'flush!' do
      before { factory.flush! }
      its(:size) { should eq 1 }
    end
  end
end
