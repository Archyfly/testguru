class Test < ApplicationRecord

  def self.cat_sort(cat_name)
    cat_id = Category.find_by(title: cat_name)
    Test.where(categories_id: cat_id).order('title DESC').pluck(:title)
  end


  def testsall
    puts 'inst method testing'
  end
end
