class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :user_id
      t.string :shop_type
      t.string :name
      t.string :price_range
      t.string :description
      t.string :phone
      t.string :email
      t.string :address
      t.string :primary_contact
      t.string :website
      t.string :details
      t.integer :rating

      t.timestamps
    end
    add_index :shops, [:user_id, :created_at]
  end
end
