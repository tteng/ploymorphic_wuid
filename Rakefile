require 'rubygems'
require 'rake'
#gem 'acts_as_tree', '>=0.1.1'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "ploymorphic_wuid"
    gem.summary = %Q{Add an unique id to your object in your application}
    gem.description = %Q{ This is a gem to generate an unique id in your application world.}
    gem.email = "tim.rubist@gmail.com"
    gem.homepage = "http://github.com/tteng/ploymorphic_wuid"
    gem.authors = ["tim.teng"]
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
  rdoc.title = "ploymorphic_wuid #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
