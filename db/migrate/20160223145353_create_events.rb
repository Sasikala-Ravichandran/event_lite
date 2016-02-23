class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.time :start_time
      t.text :venue

      t.timestamps null: false
    end
  end
end
