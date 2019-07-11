class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level, :default => 0

      t.timestamps
    end
  end
end
