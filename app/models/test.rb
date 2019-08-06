class Test < ApplicationRecord
  max = Float::INFINITY
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users # through - опция, указывающая через какую таблица идет связь
  belongs_to :author, class_name: "User" # связь с user через author

  #scope :levels, -> { pluck('title', 'level') }
  #scope :test_level, -> { where('title: title AND level: level')}

  scope :easy, -> { where("level < 2") }
  scope :medium, -> { where("level BETWEEN 2 AND 4") }
  scope :hard, -> { where("level BETWEEN 5 AND 9e999")}

  validates :level, numericality: {only_integer: true}

  validates :title, uniqueness: { scope: :level, message: "Test with some title and level exist!"} # заменил на ключ в базе


  def self.catsort2(catname2)
    Test.joins(:category).where(categories: {title: catname2}).order('tests.title DESC').pluck(:title)
  end

end
