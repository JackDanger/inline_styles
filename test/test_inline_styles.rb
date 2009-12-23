require File.dirname(__FILE__) + '/helper'

class TestInlineStyles < Test::Unit::TestCase

  CSS = <<-EOCSS
div {display: block;}
div small {font-size: 14px}
small {font-size: 0.7em}
img {border: none}
div small img {border: 1px solid #000}
EOCSS

  HTML = <<-EOHTML
<body>
  <div> Welcome </div>
  <small> stay awhile! </small>
  <div>
    <small>
      <img src='i.png'>
    </small>
  </small>
</body>
EOHTML

  context "Applying CSS to HTML" do
    setup {
      @inline = InlineStyles::Page.new(HTML).apply(CSS)
      @tree = Hpricot(@inline)
    }
    should "apply <div> style to each <div>" do
      (@tree/:div).each do |element|
        assert_has_style element, "display: block;"
      end
    end
    should "apply specific style to nested <small>" do
      assert_has_style(
        @tree.at('div small'),
        "font-size: 14px;"
      )
    end
    should "apply generic <small> style to top-nested <small>" do
      assert_has_style(
        @tree.at('body > small'),
        "font-size: 0.7em;"
      )
    end
    should "not apply generic <small> style to nested <small>" do
      assert_does_not_have_style(
        @tree.at('div small'),
        "font-size: 0.7em;"
      )
    end
    should "not apply nested <small> style to top-level <small>" do
      assert_does_not_have_style(
        @tree.at('body > small'),
        "font-size: 14px;"
      )
    end
    should "apply specific border to deeply nested <img>" do
      assert_has_style(
        @tree.at('img'),
        "border: 1px solid #000;"
      )
    end
    should "not apply generic border style to <img>" do
      assert_does_not_have_style(
        @tree.at('img'),
        "border: none;"
      )
    end
    should "render inline html exactly as expected" do
      assert_equal <<-NEWHTML, @inline
<body>
  <div style="display: block;"> Welcome </div>
  <small style="font-size: 0.7em;"> stay awhile! </small>
  <div style="display: block;">
    <small style="font-size: 14px;">
      <img src="i.png" style="border: 1px solid #000;" />
    </small>
  </small>
</div></body>
NEWHTML
    end
  end

end
