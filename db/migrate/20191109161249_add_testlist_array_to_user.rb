class AddTestlistArrayToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :test_list, :integer, array: true, default: []
  end
end
