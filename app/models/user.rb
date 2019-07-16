class User < ApplicationRecord

  # users_tests_throught_level
  def self.utl(level)
    Test.where(level: level).limit(10)
  end

  

end
