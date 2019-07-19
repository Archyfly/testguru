class RemoveColumnTestListFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :test_list, :text
  end
end
