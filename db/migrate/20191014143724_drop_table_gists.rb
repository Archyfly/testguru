class DropTableGists < ActiveRecord::Migration[5.2]
  def change
    drop_table :gists
  end
end
