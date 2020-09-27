require 'thor'
require 'commonmarker'
require 'open-uri'

module Headown
  class CLI < Thor
    desc 'extract <path>', 'extract headers from file path'

    def extract(file_path)
      file_data = URI.open(file_path) do |f|
        f.read
      end
      puts_headers(file_data)
    end

    private

    def header_nodes(data)
      doc = CommonMarker.render_doc(data)
      [].tap do |nodes|
        doc.walk do |node|
          if node.type == :header
            nodes << node
          end
        end
      end
    end

    def build_header(node)
      text = ''
      node.each do |subnode|
        if subnode.type == :text
          text = subnode.string_content
        end
      end
      '#' * node.header_level + " #{text}"
    end

    def extract_headers(file_data)
      header_nodes(file_data).map do |node|
        build_header(node)
      end
    end

    def puts_headers(file_data)
      puts extract_headers(file_data)
    end
  end
end
