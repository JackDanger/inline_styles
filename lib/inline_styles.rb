require 'css_parser'
require 'nokogiri'

module InlineStyles
  class Page
    attr_accessor :html

    def initialize(html = nil)
      @html = html
    end

    def with_css(css)
      @css = css
      self
    end

    def with_html(html)
      @html = html
      self
    end

    def selectors
      @selectors ||= begin
        parser = CssParser::Parser.new
        parser.add_block! @css

        stable_sorter = 0
        selectors = []

        # extracting selectors via the API rather than
        # just reaching in and grabbing @selectors
        parser.each_selector do |selector, declarations, specificity|
          selectors << [selector, declarations, specificity]
        end

        # stable-sort the selectors so that we get them sorted
        # by specificity but also keeping their rough
        # original order. This is how CSS selectors are applied
        # in a browser
        selectors.sort_by do |selector|
          [selector.last, stable_sorter += 1]
        end
      end
    end

    def apply(stylesheet_content = nil)
      with_css(stylesheet_content) if stylesheet_content

      tree = Nokogiri::HTML(@html)

      selectors.each do |selector, declarations, spec|
        # Find each element matching the given slector
        (tree.css selector).each do |element|

          next unless element.respond_to?(:[])
          # Merge any previously-inlined style with the
          # latest (higher specificity) one
          element['style'] ||= ''
          element['style'] = CssParser.merge(
            CssParser::RuleSet.new('', element['style'], 1),
            CssParser::RuleSet.new('', declarations, 2)
          ).declarations_to_s
        end
      end

      tree.to_s
    end
  end

  # taken from http://moserei.de/index.php/17/stable-array-sorting-in-ruby
  class StableSortingArray < Array
    def sort_by
      n = 0
      c = lambda {|x| n+= 1; [x, n] }
      sort {|a, b| yield(c.call(a), c.call(b)) }
    end
  end
end
