class AddColumnIsCompletedToTestPassage < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :is_finished, :boolean, default: false
  end
end
