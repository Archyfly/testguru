class User < ApplicationRecord

  def tests_of_user_from_level(testlevel)
    Test.joins('join user_tests on user_tests.user_id = user.id').where(user_tests: {level: testlevel)
  end
end
