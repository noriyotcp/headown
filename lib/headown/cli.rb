require 'thor'
require 'commonmarker'
require 'open-uri'

module Headown
  class CLI < Thor
    desc 'extract <path>', 'extract headers from file path'

    def extract(file_path)
      raise Headown::NotMarkdownError.new(file_path: file_path) if File.extname(file_path) != '.md'

      file_data = URI.open(file_path, &:read)
      puts_headers(file_data)
    rescue Headown::NotMarkdownError => e
      puts <<~MSG
      #{e.class}:
        #{e.message}
      MSG
    end

    private

    def header_nodes(data)
      doc = CommonMarker.render_doc(data)
      [].tap { |nodes| doc.walk { |node| nodes << node if node.type == :header } }
    end

    def build_header(node)
      text = ''
      node.each { |subnode| text = subnode.string_content if subnode.type == :text }
      '#' * node.header_level + " #{text}"
    end

    def extract_headers(file_data)
      header_nodes(file_data).map { |node| build_header(node) }
    end

    def puts_headers(file_data)
      puts extract_headers(file_data)
    end
  end
end
