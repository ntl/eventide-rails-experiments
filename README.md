# Eventide::Rails Experiments

Demonstrate loading the message_store schema into an existing Rails database.

- bundle install in the repo root

```
cd test/example-host
# may need to bundle install here as well
rails db:create
rails generate eventide:install
rails db:migrate
```

Verify the eventide functionality works from the rails db user:
(modify `DATABASE_USER` value as needed to match your rails db user)

```
DATABASE_NAME=example_host_development DATABASE_USER=josh $(bundle show message-db)/database/write-test-message.sh
```
