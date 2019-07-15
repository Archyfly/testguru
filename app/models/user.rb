class User < ApplicationRecord
  def user_test(users_id)
    find(users_id)
  end
end
