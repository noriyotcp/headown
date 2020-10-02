RSpec.describe Headown::CLI do
  let(:headown) { described_class.new }

  describe '#extract' do
    context 'when it can NOT find a markdown file' do
      it 'can NOT extract headers' do
        expect { headown.extract('spec/headown/non-exist.md') }.to raise_error(Errno::ENOENT)
      end
    end
  end

  describe 'Headown::NotMarkdownError' do
    let(:html_file) { 'spec/headown/non-md.html' }
    context 'when path to html is passed' do
      it do
        expect { raise Headown::NotMarkdownError.new(file_path: html_file) }.to raise_error(
          Headown::NotMarkdownError,
          "#{html_file} is not a Markdown file."
        )
      end
    end
  end
end
