class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :eventname
      t.text :feedback
      t.timestamps
    end
  end
end
