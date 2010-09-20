require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "inline_styles"
    gem.summary = %Q{Squish a CSS stylesheet into any semantic HTML}
    gem.description = %Q{To make your HTML display properly when stylesheet support isn't available (e.g. Gmail) this lets you attach all your CSS to the 'style' attribute of each element.}
    gem.email = "gitcommit@6brand.com"
    gem.homepage = "http://github.com/JackDanger/inline_styles"
    gem.authors = ["Jack Danger Canty"]
    gem.add_dependency "nokogiri", ">= 0"
    gem.add_dependency "css_parser", ">= 0"
    gem.add_development_dependency "shoulda", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "inline_styles #{version}"
  rdoc.rdoc_files.include('lib/**/*.rb')
end
