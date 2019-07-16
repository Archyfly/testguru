class User < ApplicationRecord

  # users_tests_throught_level
  def user_tests_level(test_level)
    user_test = Test.find_by(level: test_level)
    User.where(test_id: user_test)
  end
end
