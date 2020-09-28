require 'headown/version'
require 'headown/cli'

module Headown
  class NotMarkdownError < StandardError
    def initialize(file_path:)
      msg = "#{file_path} is not a Markdown file."
      super(msg)
    end
  end
end
