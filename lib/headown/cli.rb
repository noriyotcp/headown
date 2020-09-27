require 'thor'

module Headown
  class CLI < Thor
    desc 'extract <path>', 'extract headers from file path'
    def extract(file_path)
      ['# h1', '## h2']
    end
  end
end
