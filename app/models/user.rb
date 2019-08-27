class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages # through - опция, указывающая через какую таблица идет связь
  has_many :authored_tests, class_name: "Test", foreign_key: :user_id

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  validates :email, presence: true

  def tests_of_user_from_level(testlevel)
    Test.joins('join user_tests on user_tests.user_id = user.id').where(user_tests: {level: testlevel})
  end


end
