require 'spec_helper'
require 'dry-monads'
RSpec.describe Boxbot::Edge::Transactions::Create do
  include_examples 'dimensions-5x4x3'

  let(:operation) { described_class.new }
  let(:edges) { Boxbot::Factories::EdgeBuilder.new.build(dimensions_5x4x3) }

  context 'first edge' do
    subject(:input) { edges.first }
    it { is_expected.to be_kind_of(Boxbot::Edge::Model) }
    
    context 'transaction' do
      subject(:result) { operation.call(input) }
      it { is_expected.to be_kind_of(Dry::Monads::Result::Success) }
    end
  end
end
