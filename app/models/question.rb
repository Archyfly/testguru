class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  scope :answers_count, -> { joins(:answers).count(:title) } # выдает количество записей соответствующих вопросу.


  validates :title, presence: true
  validate :validate_count_answers

  def validate_count_answers
    errors.add(:answers_count) if ((answers_count < 1) || (answers_count > 4))
  end

  def self.count_ans
    puts :answers_select
    joins(:answers).count(:title)
  end

end
