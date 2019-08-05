class Question < ApplicationRecord
  belongs_to :test#, optional: true
  has_many :answers

  # scope :answers_count, -> { joins(:answers).count(:title) }
  # выдает количество записей соответствующих вопросу. так то работает, но не принято


  validates :title, presence: true
  #validate :valid_count

  # def valid_count
  #  if answers.size.to_i >= 4 then
  #    errors.add(:answers, "can be from 1 to 4")
  #  end
  # end

  # def self.count_ans
  #  joins(:answers).count(:title)
  # end

end
