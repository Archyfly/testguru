class AddColumnCriteriaToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :criteria, :integer, array: true, default: []
  end
end
