Hanami::Model.migration do
  change do
    create_table :books do
      primary_key :id

      column :title,  String, null: false
      column :author, String, null: false
      column :tenant_id, Integer, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
    execute <<~SQL
      CREATE POLICY access_policy ON books
        FOR ALL
        TO PUBLIC
        USING (tenant_id = current_setting('app.tenant_id')::integer)
      ;
      ALTER TABLE books ENABLE ROW LEVEL SECURITY
      ;
      INSERT INTO books VALUES
        (1, 'テナント1のBook', '太郎', 1, 'now', 'now'),
        (2, 'テナント2のBook', '次郎', 2, 'now', 'now')
      ;
    SQL
  end
end
