class AddRefTestsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :users , index: true
  end
end
