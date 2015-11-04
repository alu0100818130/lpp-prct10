require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
    task :default => :spec
    
desc "Ejecutar las espectativas de la clase Bibliografia"
task :spec do
  sh "rspec -I. spec/bibliografia.rb"
end  

desc "Ejecutar con documentacion"
task :doc do
  sh "rspec -I. spec/bibliografia.rb --format documentation"
end