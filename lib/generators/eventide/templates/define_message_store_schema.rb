class <%= migration_class_name %> < ActiveRecord::Migration[<%= ActiveRecord::Migration.current_version %>]
  def up

    execute(<<~SQL_SCRIPT)
    <%=
      require "generators/eventide/initial_schema"
      ::Generators::Eventide::InitialSchema.()
    %>
    SQL_SCRIPT

    # I don't like this. Feels dangerous/non-deterministic
    # Figure out how we should handle the search_path for the rails user
    database = ActiveRecord::Base.connection_config[:database]
    current_search_path = execute("SELECT current_setting('search_path')").values[0][0]
    search_path = "#{current_search_path}, message_store"
    execute("ALTER DATABASE #{database} SET search_path TO #{search_path};")
  end

  def down
    execute("DROP SCHEMA message_store CASCADE")
    # undo the search_path modification
  end
end

