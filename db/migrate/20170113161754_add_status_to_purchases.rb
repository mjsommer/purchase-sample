class AddStatusToPurchases < ActiveRecord::Migration
  def change
    execute <<-SQL
      CREATE TYPE status AS ENUM ('draft', 'completed', 'cancelled');
    SQL

    add_column :purchases, :status, :status, default: 'draft', index: true
  end
end
