class AddColumnUserBadgesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_badges, :integer, array: true, default: []
  end
end
