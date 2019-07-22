class TestsUser < ApplicationRecord
  belongs_to :user
  belongs_to :test
end


# Так как таблица называется tests_users то модель по соглашению: TestsUser (единственное число)
