require 'spec_helper'
require 'dry-monads'
RSpec.describe Boxbot::Transactions::Create do
  include_examples 'settings-5x4x3'

  let(:operation) { described_class.new }
  let(:edges) { Boxbot::Factories::GeoBuilder.new.build(settings_5x4x3) }

  context 'first edge' do
    subject(:input) { edges.first }
    it { is_expected.to be_kind_of(Boxbot::Geo::Edge) }
    
    context 'transaction' do
      subject(:result) { operation.call(input) }
      it { is_expected.to be_kind_of(Dry::Monads::Result::Success) }
    end
  end
end
