class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :event_type
      t.string :name
      t.date :date
      t.time :time
      t.integer :budget
      t.string :bride_name
      t.string :groom_name

      t.timestamps
    end
    add_index :events, [:user_id, :created_at]
  end
end
