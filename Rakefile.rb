#require 'rspec'
require 'rspec/core/rake_task'

desc 'Default: run specs.'
task :default => :spec

RSpec::Core::RakeTask.new('spec') do |t|
  t.pattern = %w[spec/*.rb]
  t.rspec_opts = %w[ --color --format documentation]
  t.fail_on_error = false
end
