
module InlineStyles
  class Page
    attr_accessor :html

    def initialize(html)
      @html = html
    end

    def apply(css)
      gem 'css_parser'
      require 'css_parser'
      gem 'hpricot'
      require 'hpricot'

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
  end
end

if __FILE__ == $0
  page = InlineStyles::Page.new(<<-EOHTML
<div class='coupon offering' id='offering_148'>
  <div class='business'>
    <a href="http://cloops.local/businesses/1">Jack's Burrito Dome</a>
    <span class='business_distance_away'>
      <span class='distance'>around <span class='number' rel='0.0'>1</span> <span class='unit'>block</span></span>
      away from you
    </span>
  </div>
  <div class='clearer'></div>
  <span class='discount'><span class='discount_value'></span><span class='discount_type'>Free</span></span>
  <span class='name'>Free taco every Wednesday</span>
  <span class='applies_to'>With purchase of a drink</span>
  <table class='lower'>
    <tr>
      <td class='expires'>
        valid through
        Mar 05, 2010
      </td>
      <td class='code'>
        code:
        <a href="/offerings/148" class="use">148</a>
      </td>
    </tr>
  </table>
</div>
EOHTML
)

  puts page.apply(File.read("#{File.dirname(__FILE__)}/../public/stylesheets/coupon_html.css"))

end