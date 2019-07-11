class AddTestsReferencesToCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :categories, index: true
  end
end
