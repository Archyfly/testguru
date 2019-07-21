class User < ApplicationRecord
has_many :tests_users
has_many :tests, through: :tests_users # through - опция, указывающая через какую таблица идет связь
has_many :tests, :foreign_key => "author_id"

  def tests_of_user_from_level(testlevel)
    Test.joins('join user_tests on user_tests.user_id = user.id').where(user_tests: {level: testlevel})
  end
end
