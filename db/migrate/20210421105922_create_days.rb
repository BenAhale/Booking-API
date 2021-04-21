class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :slot_length
      t.integer :slot_capacity

      t.timestamps
    end
  end
end
