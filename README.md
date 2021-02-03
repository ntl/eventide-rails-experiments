# Eventide::Rails Experiments

Demonstrate loading the message_store schema into an existing Rails database.

- bundle install in the repo root

```
pushd test/example-host

bin/rails db:create
bin/rails generate eventide:install
bin/rails db:migrate
```

Verify the eventide functionality works from the rails db user:
(modify `DATABASE_USER` value as needed to match your rails db user)

```
DATABASE_NAME=example_host_development DATABASE_USER=josh $(bundle show message-db)/database/write-test-message.sh
```
