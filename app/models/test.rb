class Test < ApplicationRecord
belongs_to :category

  # Через 2 запроса
  def self.cat_sort(cat_name)
    cat_id = Category.find_by(title: cat_name)
    Test.where(categories_id: cat_id).order('title DESC').pluck(:title)
  end

  # через scope
  #def self.catsort(catname)
  #  scope :category_select, -> {where (title: catname)}
  #  Test.category_select.order('title DESC').pluck(:title)
  #end

  # Через 1 запрос
  def self.catsort2(catname2)
    Test.joins(:category).where(categories: {title: catname2}).order('tests.title DESC').pluck(:title)
  end

end
