require "erb"
require "rubycritic/report_generators/base_generator"

module Rubycritic

  class IndexGenerator < BaseGenerator
    INDEX_TEMPLATE = ERB.new(File.read(File.join(TEMPLATES_DIR, "index.html.erb")))

    def initialize(file_generators)
      @file_generators = file_generators.sort { |a, b| a.analysed_file_name <=> b.analysed_file_name }
    end

    def file_directory
      REPORT_DIR
    end

    def file_name
      "index.html"
    end

    def render
      index_body = INDEX_TEMPLATE.result(get_binding)
      LAYOUT_TEMPLATE.result(get_binding { index_body })
    end
  end

end
