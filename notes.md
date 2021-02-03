# Notes

## Tasks

- Import message-db schema installation scripts (`lib/generators/initial_schema.rb`)
  - Expand the file list at runtime, versus hard-coding the list of files

- Migration
  - Determine the best way to put the messages table in the search path for Rails' database user (i.e. the postgres user specified in `config/database.yml`)
    - The current approach executes a SQL statement
      - `ALTER DATABASE #{database} SET search_path TO #{current_search_path}, message_store`
    - Whatever approach is taken must also be reversed in the migration's `down` method

- Connection sharing
  - Refresh memory on the issue around `ActiveRecord::Base.transaction do … end`
    - It had something to do with surprising behavior, where a rollback was expected, but a commit happened instead
