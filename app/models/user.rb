class User < ApplicationRecord

  def tests_of_user_from_level(testlevel)
    Test.joins('join user_tests on user_tests.test_id = tests.id').where(user_tests: {user_id: user.id}, level: testlevel)
  end
end
