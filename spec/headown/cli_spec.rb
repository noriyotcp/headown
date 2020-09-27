RSpec.describe Headown::CLI do
  let(:headown) { described_class.new }

  describe '#extract_headers' do
    context 'when it finds a markdown file' do
      it 'extracts headers' do
        file_data = URI.open('spec/headown/sample.md') do |f|
          f.read
        end
        expect(headown.send(:extract_headers, file_data)).to eq ["# h1", "## h2", "### h3", "#### h4", "##### h5", "###### h6"]
      end
    end
  end

  describe '#extract' do
    context 'when it can NOT find a markdown file' do
      it 'can NOT extract headers' do
        expect{ headown.extract('spec/headown/non-exist.md') }.to raise_error(Errno::ENOENT)
      end
    end
  end
end
