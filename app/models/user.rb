# require 'digest/sha1'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  # include Auth - удаляем после подключения гема bcrypt

  has_many :test_passages
  has_many :tests, through: :test_passages # through - опция, указывающая через какую таблица идет связь
  has_many :authored_tests, class_name: "Test", foreign_key: :author_id

  # has_secure_password

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, uniqueness: :true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def tests_of_user_from_level(testlevel)
    Test.joins('join user_tests on user_tests.user_id = user.id').where(user_tests: {level: testlevel})
  end

  def admin?
    self.is_a?(Admin)
  end

end
