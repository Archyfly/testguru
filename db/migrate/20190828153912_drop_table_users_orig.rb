class DropTableUsersOrig < ActiveRecord::Migration[5.2]
  def change
    drop_table :users_orig
  end
end
