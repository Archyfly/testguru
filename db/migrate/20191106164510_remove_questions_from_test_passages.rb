class RemoveQuestionsFromTestPassages < ActiveRecord::Migration[5.2]
  def change
    remove_reference :test_passages, :current_question, foreign_key: {to_table: :questions}
  end
end
