class Answer < ApplicationRecord
  belongs_to :question

  scope :is_true, -> { where("correct = 1")}
end
