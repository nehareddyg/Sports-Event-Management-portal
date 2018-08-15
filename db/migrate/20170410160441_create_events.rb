class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.integer :duration, null: false
      t.integer :teamsize, null:false
      t.integer :numberofteams, default: 0
      t.integer :maxnumberofteams, default: 10
      t.integer :expectedNoOfAttendees, default: 0
      t.timestamps
    end
  end
end
