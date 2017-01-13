class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.string :purchased_at

      t.timestamps null: false
    end

    add_foreign_key :purchases, :users, column: "user_id", name: "fk_user_purchases"
  end
end