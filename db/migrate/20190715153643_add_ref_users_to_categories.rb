class AddRefUsersToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :categories, index: true
  end
end
