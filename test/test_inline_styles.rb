require File.dirname(__FILE__) + '/helper'

class TestInlineStyles < Test::Unit::TestCase

  CSS = <<-EOCSS
div {display: block;}
div small {font-size: 0.6em}
small {font-size: 0.7em}
img {border: none}
div small img {border: 1px solid #000}
EOCSS

  HTML - <<-EOHTML
<div> Welcome </div>
<small> stay awhile! </small>
<div>
  <small>
    <img src='i.png'>
  </small>
</small>
EOHTML

  context "Applying CSS to HTML" do
    setup {  }
    sh
  end

end
