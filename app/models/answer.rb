class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true)}

  validate :answers_from_one_to_four

  def answers_from_one_to_four
    errors.add(:question, 'has so many answers') if (question.answers.count) >= 4
  end
end
