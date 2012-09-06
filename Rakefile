#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

desc 'Run rspec'
Rspec::Core::RakeTask.new(:rspec) do |rspec|
  rspec.pattern = 'spec/**/*_spec.rb'
  rspec.rspec_opts = ['-cfs']
end
task :default => :rspec
