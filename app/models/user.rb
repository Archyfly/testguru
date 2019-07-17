class User < ApplicationRecord
has_many :tests

  def self.user_tests_from_level(testlevel)
    test_list_from_user = User.select(:test_list)
    test_list_from_user.each do |user_test_id|
      User.joins(:tests).where(tests: {level: testlevel}).where(tests: {test_id: user_test_id})
    end
  end

end
