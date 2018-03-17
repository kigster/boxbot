require 'spec_helper'

RSpec.describe Boxbot::Compute::TabCalculator do
  include_examples 'settings-5x4x3'

  let(:dimension_identifier) { 1 }
  let(:calculator) { described_class.new(settings_5x4x3) }
  subject(:tab_count) { calculator[dimension_identifier] }

  context 'when called with an invalid argument' do
    let(:dimension_identifier) { Object.new }
    it { expect { tab_count }.to raise_error(ArgumentError) }
  end

  context 'when called with a depth index of 2' do
    let(:dimension_identifier) { 2 }
    let(:tab_override) { 0.125 }
    it { is_expected.to eq 25 }
  end

  context 'when called with a height as a string' do
    let(:dimension_identifier) { 'height' }
    let(:tab_override) { 0.5 }
    it { is_expected.to eq 9 }
  end

  context 'when called with a width as a symbol' do
    let(:dimension_identifier) { :width }
    let(:tab_override) { nil }

    it { is_expected.to eq 11 }

    context 'with an alternative tab suggested' do
      let(:tab_override) { 1.0 }
      it { is_expected.to eq 5 }
    end

    context 'with a suggested tab is too small' do
      let(:tab_override) { 0.01 }
      it { is_expected.to eq 99 }
    end

    context 'with a tab suggested is too large' do
      let(:tab_override) { 3.0 }
      it { is_expected.to eq 3 }
    end
  end

  context '#calculate' do
    subject(:result) { calculator.calculate(dimension_identifier) }
    it { should be_a_kind_of(Boxbot::Compute::TabWidthResult)}
    its(:dimension) { should eq 'height' }
    its(:length) { should eq 4.0 }
    its(:tab_count) { should eq 9 }
    its(:tab_width) { should eq result.length/result.tab_count }
  end
end
