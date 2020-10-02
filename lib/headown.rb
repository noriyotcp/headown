require 'headown/version'
require 'open-uri'
require 'commonmarker'

module Headown
  class NotMarkdownError < StandardError
    def initialize(file_path:)
      msg = "#{file_path} is not a Markdown file."
      super(msg)
    end
  end

  class Extractor
    attr_reader :headers

    def initialize(file_path)
      raise Headown::NotMarkdownError.new(file_path: file_path) if File.extname(file_path) != '.md'

      file_data = URI.open(file_path, &:read)
      extract_headers(file_data)
    end

    private

    def extract_headers(file_data)
      @headers = header_nodes(file_data).map { |node| build_header(node) }
    end

    def header_nodes(data)
      doc = CommonMarker.render_doc(data)
      [].tap { |nodes| doc.walk { |node| nodes << node if node.type == :header } }
    end

    def build_header(node)
      text = ''
      node.each { |subnode| text = subnode.string_content if subnode.type == :text }
      '#' * node.header_level + " #{text}"
    end
  end
end
