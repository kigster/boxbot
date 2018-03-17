RSpec.shared_examples 'box-5x4x3' do
  let(:width) { 5.0 }
  let(:height) { 4.0 }
  let(:depth) { 3.0 }
  let(:thickness) { 0.125 }
  let(:kerf) { 0.0 }
  let(:tab) { nil }
end

RSpec.shared_examples 'box-5x4x3-tab' do
  include_examples 'box-5x4x3'
  let(:tab) { 0.5 }
end

RSpec.shared_examples 'settings-5x4x3' do
  let(:tab_override) { nil }
  include_examples 'box-5x4x3'

  let(:settings_args) do
    {
      height:    height,
      width:     width,
      depth:     depth,
      thickness: thickness,
      kerf:      kerf,
      tab:       tab
    }
  end

  before do
    settings_args[:tab] = tab_override if tab_override
  end

  let(:settings_5x4x3) { Boxbot::Settings.new(**settings_args) }
end

