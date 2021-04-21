class CreateSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :slots do |t|
      t.references :day, null: false, foreign_key: true
      t.datetime :time
      t.integer :capacity

      t.timestamps
    end
  end
end
