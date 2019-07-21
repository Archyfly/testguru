class UpdateColumnQuestionsId < ActiveRecord::Migration[5.2]
  def change
    rename_column :answers, :questions_id, :question_id
  end
end
