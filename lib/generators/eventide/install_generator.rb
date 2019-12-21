require 'rails/generators/active_record'

# This is specific to active_record - should make that clear
# (not all rails projects use active_record)

module Eventide
  class InstallGenerator < ::Rails::Generators::Base
    include ActiveRecord::Generators::Migration

    source_root File.expand_path('templates', __dir__)

    def generate_migration
      migration_template(
        "define_message_store_schema.rb",
        File.join(db_migrate_path, "define_message_store_schema.rb")
      )
    end
  end
end
