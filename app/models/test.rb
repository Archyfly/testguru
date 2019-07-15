class Test < ApplicationRecord
  def self.cat_sort(cat_name)
    #pluck
    puts "cat_name = #{cat_name}"

    cat_id = where(title: "#{cat_name}")
    puts "cat_id = #{cat_id}"
    # list = where(categories.id: cat_id)
    # "#{cat_name}")
  end


  def testsall
    puts 'inst method testing'
  end
end
