class AddColumnTestDurationToTest < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :test_duration, :integer
  end
end
