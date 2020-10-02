require 'thor'

module Headown
  class CLI < Thor
    desc 'extract <path>', 'extract headers from file path'

    def extract(file_path)
      extractor = Headown::Extractor.new(file_path)
      puts extractor.headers
    rescue Headown::NotMarkdownError => e
      puts <<~MSG
      #{e.class}:
        #{e.message}
      MSG
    end
  end
end
