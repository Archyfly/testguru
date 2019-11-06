class AddQuestionsReferenceToGists < ActiveRecord::Migration[5.2]
  def change
    add_reference :gists, :question, foreign_key: :true, on_delete: :cascade
  end
end
