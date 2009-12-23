# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{inline_styles}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jack Danger Canty"]
  s.date = %q{2009-12-22}
  s.description = %q{To make your HTML display properly when stylesheet support isn't available (e.g. Gmail) this lets you attach all your CSS to the 'style' attribute of each element.}
  s.email = %q{gitcommit@6brand.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "inline_styles.gemspec",
     "lib/inline_styles.rb",
     "test/helper.rb",
     "test/test_inline_styles.rb"
  ]
  s.homepage = %q{http://github.com/JackDanger/inline_styles}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Squish a CSS stylesheet into any semantic HTML}
  s.test_files = [
    "test/helper.rb",
     "test/test_inline_styles.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hpricot>, [">= 0"])
      s.add_runtime_dependency(%q<css_parser>, [">= 0"])
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<hpricot>, [">= 0"])
      s.add_dependency(%q<css_parser>, [">= 0"])
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<hpricot>, [">= 0"])
    s.add_dependency(%q<css_parser>, [">= 0"])
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end

