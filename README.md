# Row Level Security 検証

```sh
$ docker-compose up
$ bundle install
$ bundle exec hanami db create
$ bundle exec hanami db migrate
$ bundle exec hanami db console
```
```sql
SELECT set_config('app.tenant_id', '1', false);
SELECT * FROM books;
```
