class FixUserIdColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :tests, :users_id, :user_id
  end
end
