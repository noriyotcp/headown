RSpec.describe Headown::CLI do
  it 'extract headers' do
    expect(described_class.new.extract('spec/headown/sample.md')).to eq ["# h1", "## h2", "### h3", "#### h4", "##### h5", "###### h6"]
  end
end
