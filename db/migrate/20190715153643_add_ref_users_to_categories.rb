class AddRefUsersToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :index, :true
  end
end
