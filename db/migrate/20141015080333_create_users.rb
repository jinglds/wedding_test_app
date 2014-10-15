class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :role
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :primary_contact

      t.timestamps
    end
  end
end
