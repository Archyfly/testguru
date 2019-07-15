class Test < ApplicationRecord
  def self.cat_sort(cat_name)
      #pluck
      cat_id = where(title: "#{cat_name}")
      #where(categories.id: cat_id)
       #"#{cat_name}")
    end


  def testsall
    puts 'inst method testing'
  end
end
