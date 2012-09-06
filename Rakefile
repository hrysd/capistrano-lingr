#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task default: :spec
desc 'Run rspec'
Rspec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['-cfs']
end
