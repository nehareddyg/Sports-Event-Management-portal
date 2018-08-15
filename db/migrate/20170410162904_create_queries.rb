class CreateQueries < ActiveRecord::Migration[5.0]
  def change
    create_table :queries do |t|
      t.string :question
      t.string :answer
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
