
module InlineStyles
  class Page
    attr_accessor :html

    def initialize(html)
      @html = html
    end

    def apply(css)
      require_dependencies

      parser = CssParser::Parser.new
      parser.add_block! css

      tree = Hpricot(html)

      parser.each_rule_set do |rule_set|
        rule_set.each_selector do |selector, declarations, specificity|
          (tree/selector).each do |element|
            element['style'] ||= ''
            element['style'] += declarations.to_s
          end
        end
      end

      tree.to_s
    end

    protected

      def require_dependencies
        gem 'css_parser'
        require 'css_parser'
        gem 'hpricot'
        require 'hpricot'
      end
  end
end
