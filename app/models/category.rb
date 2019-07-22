class Category < ApplicationRecord
  has_many :tests

  scope :view_title_asc, -> { pluck("title").order('title ASC')}

end
