class AddQuestionsToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_reference :test_passages, :current_question, foreign_key: {to_table: :questions}, on_delete: :cascade
  end
end
