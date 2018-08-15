class Addadminflag < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :adminflag, :integer, :null => false, :default => 0
  end
end
