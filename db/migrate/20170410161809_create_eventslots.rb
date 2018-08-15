class CreateEventslots < ActiveRecord::Migration[5.0]
  def change
    create_table :eventslots do |t|
      t.string :team1name
      t.string :team2name
      t.time :starttime
      t.time :endtime
      t.string :venue
      t.string :winner
      t.references :eventschedule , index: true, foreign_key: true
      t.timestamps
    end
  end
end
