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

    context 'when it finds a markdown file online' do
      it 'extracts headers' do
        file_data = URI.open('https://raw.githubusercontent.com/noriyotcp/headown/main/spec/headown/sample.md') do |f|
          f.read
        end
        expect(headown.send(:extract_headers, file_data)).to eq ["# h1", "## h2", "### h3", "#### h4", "##### h5", "###### h6"]
      end
    end

    # cf. https://spec.commonmark.org/0.29/#atx-headings
    describe 'interrupting paragraphs' do
      context 'when ATX headings are not separated from surrounding content by blank lines' do
        it 'extracts headers' do
          file_data = URI.open('spec/headown/sample2.md') do |f|
            f.read
          end
          expect(headown.send(:extract_headers, file_data)).to eq ['# baz']
        end
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
