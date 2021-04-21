class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.date :date
      t.datetime :start_time
      t.datetime :end_time
      t.integer :slot_length
      t.integer :slot_capacity

      t.timestamps
    end
  end
end
