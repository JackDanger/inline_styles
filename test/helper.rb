require 'rubygems'
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'inline_styles'

class Test::Unit::TestCase
  def assert_has_style(element, style)
    assert element['style'].include?(style), "Expected #{element['style'].inspect} to include #{style.inspect}"
  end
  def assert_does_not_have_style(element, style)
    assert !element['style'].include?(style), "Expected #{element['style'].inspect} to not include #{style.inspect}"
  end
end