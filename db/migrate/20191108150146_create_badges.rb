class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :badgeurl
      t.string :description
            
      t.timestamps
    end
  end
end
