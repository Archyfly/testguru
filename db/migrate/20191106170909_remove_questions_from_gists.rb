class RemoveQuestionsFromGists < ActiveRecord::Migration[5.2]
  def change
      remove_reference :gists, :question, foreign_key: :true
  end
end
