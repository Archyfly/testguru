class AddTestsArrayToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :test_list, :text, array: true
  end
end
