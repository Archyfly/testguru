class Test < ApplicationRecord
  max = Float::INFINITY
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users # through - опция, указывающая через какую таблица идет связь
  belongs_to :author, class_name: "User" # связь с user через author

  scope :levels, -> { pluck('title', 'level') }
  scope :easy, -> { where("level < 2") }
  scope :medium, -> { where("level BETWEEN 2 AND 4") }
  scope :hard, -> { where("level BETWEEN 5 AND max")}

  def self.catsort2(catname2)
    Test.joins(:category).where(categories: {title: catname2}).order('tests.title DESC').pluck(:title)
  end


  # Через 2 запроса (примерно)
  #def self.cat_sort(cat_name)
  #  cat_id = Category.find_by(title: cat_name)
  #  Test.where(categories_id: cat_id).order('title DESC').pluck(:title)
  #end

  # через scope
  #def self.catsort(catname)
  #  scope :category_select, -> {where (title: catname)}
  #  Test.category_select.order('title DESC').pluck(:title)
  #end

  # Через 1 запрос
end
