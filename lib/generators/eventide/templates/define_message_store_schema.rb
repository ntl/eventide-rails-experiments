class <%= migration_class_name %> < ActiveRecord::Migration[<%= ActiveRecord::Migration.current_version %>]
  def up
    # loop over the source files installed by message-db gem and inline them here
  end

  def down
    execute("DROP SCHEMA message_store CASCADE")
  end
end

