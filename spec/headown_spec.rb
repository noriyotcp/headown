RSpec.describe Headown do
  it 'has a version number' do
    expect(Headown::VERSION).not_to be nil
  end

  describe 'Headown::Extractor' do
    subject { Headown::Extractor.new(file_path).headers }

    describe '#headers' do
      context 'when it finds a markdown file' do
        let(:file_path) { 'spec/headown/sample.md' }
        it { is_expected.to eq ['# h1', '## h2', '### h3', '#### h4', '##### h5', '###### h6'] }
      end

      context 'when it finds a markdown file online' do
        let(:file_path) { 'https://raw.githubusercontent.com/noriyotcp/headown/main/spec/headown/sample.md' }
        it { is_expected.to eq ['# h1', '## h2', '### h3', '#### h4', '##### h5', '###### h6'] }
      end

      # cf. https://spec.commonmark.org/0.29/#atx-headings
      describe 'interrupting paragraphs' do
        context 'when ATX headings are not separated from surrounding content by blank lines' do
          let(:file_path) { 'spec/headown/sample2.md' }
          it { is_expected.to eq ['# baz'] }
        end
      end
    end
  end
end
