class AddMethodToEndpoints < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      CREATE TYPE endpoint_method AS ENUM ('get', 'post', 'put', 'delete', 'patch', 'head');
    SQL
    add_column :endpoints, :method, :endpoint_method, default: 'get'
    add_index :endpoints, :method
  end

  def down
    remove_column :endpoints, :method
    execute <<-SQL
      DROP TYPE endpoint_method;
    SQL
  end
end
