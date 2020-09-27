RSpec.describe Headown::CLI do
  it 'extract headers' do
    expect(described_class.new.extract('./sample.md')).to eq ['# h1', '## h2']
  end
end
