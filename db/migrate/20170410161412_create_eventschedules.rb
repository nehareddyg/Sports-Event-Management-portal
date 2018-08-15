class CreateEventschedules < ActiveRecord::Migration[5.0]
  def change
    create_table :eventschedules do |t|
      t.date :date
      t.time :starttime
      t.time :endtime
      t.references :event, index: true, foreign_key: true
      t.timestamps
    end
  end
end