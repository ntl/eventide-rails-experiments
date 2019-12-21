module Generators
  module Eventide
    class InitialSchema
      SCRIPTS = %w(
        schema/message-store.sql
        extensions/pgcrypto.sql
        tables/messages.sql
        types/message.sql
        functions/message-store-version.sql
        functions/hash-64.sql
        functions/acquire-lock.sql
        functions/category.sql
        functions/is-category.sql
        functions/id.sql
        functions/cardinal-id.sql
        functions/stream-version.sql
        functions/write-message.sql
        functions/get-stream-messages.sql
        functions/get-category-messages.sql
        functions/get-last-stream-message.sql
        indexes/messages-id.sql
        indexes/messages-stream.sql
        indexes/messages-category.sql
        views/stream-summary.sql
        views/type-summary.sql
        views/stream-type-summary.sql
        views/type-stream-summary.sql
        views/category-type-summary.sql
        views/type-category-summary.sql
      )

      def self.call
        build.call
      end

      def self.build
        spec = Gem::Specification.find_by_name("message-db")
        root_path = File.join(spec.gem_dir, "database")

        new(root_path)
      end

      def initialize(root_path)
        @root_path = root_path
      end

      def call
        SCRIPTS.map{|base|
          path = File.join(@root_path, base)
          File.read(path)
        }.join("\n")
      end
    end
  end
end
