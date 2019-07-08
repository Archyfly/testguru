class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :title
      t.boolean :correct, DEFAULT => false
      
      t.timestamps
    end
  end
end
