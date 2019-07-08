class CreateAddColumnCorrectToAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :add_column_correct_to_answers do |t|

      t.timestamps
    end
  end
end
