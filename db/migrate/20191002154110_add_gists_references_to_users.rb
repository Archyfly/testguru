class AddGistsReferencesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :gists, :users , index: true
  end
end
