unless DATABASE.table_exists?(:users)
  DATABASE.create_table :users do
    primary_key :id
    String :name
    String :email
  end
end
