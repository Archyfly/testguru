class AnswersChangeColumnNameTitleToBody < ActiveRecord::Migration[5.2]
  def change
    rename_column :answers, :title, :body
  end
end
