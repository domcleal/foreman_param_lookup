# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'
require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "foreman_param_lookup"
  gem.homepage = "http://github.com/domcleal/foreman_param_lookup"
  gem.license = "GPL-3"
  gem.summary = %Q{Exposes smart class parameters lookups as an API}
  gem.description = %Q{Exposes smart class parameters lookups as an API}
  gem.email = "dcleal@redhat.com"
  gem.authors = ["Dominic Cleal"]
  # dependencies defined in Gemfile
end

task :default => :test
