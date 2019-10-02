class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.string :gisturl
      t.timestamps
    end
  end
end
