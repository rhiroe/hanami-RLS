# Row Level Security 検証

```sh
$ docker-compose up -d
$ bundle install
$ bundle exec hanami db create
$ bundle exec hanami db migrate
$ bundle exec hanami db console
```
```sql
SELECT set_config('app.tenant_id', '1', false);
SELECT * FROM books;
```

```rb
repo = BookRepository.new
repo.container.gateways[:default].connection.execute("SELECT set_config('app.tenant_id', '1', false)")
repo.all
```