namespace :eventide do
  desc "Configures a Rails application to integrate with Eventide"
  task :install => [:generate_init_migration] do
    puts "Installing"
  end

  task :generate_init_migration do
    puts "Generating initial migration"
  end
end
