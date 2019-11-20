class AwardService

  def initialize(user, test)
    @badges = Badge.all
    @test = test

    @user = user
  end

  def award_user(user)
    @badges.each do |badge|
      if send("#{badge.rule}_award?", badge) && !@user.user_badges.include?(badge.id)
        @user.user_badges << badge.id
      end
    end
    @user.save!
  end

  def databases_tests_award?(badge)
    db_tests = Test.all.where(category_id: 2)
    db_tests_count = db_tests.count

    # количество успешных прохождений надо вынести, так как повторяющийся запрос
    success_test_passages_count = TestPassage.all.where(is_finished: true, test_id: db_tests.ids, user_id: @user.id).count
    #badge = Badge.find(1)
    return true if success_test_passages_count >= db_tests_count
  end

  def framework_tests_award?(badge)
    db_tests = Test.all.where(category_id: 1)
    db_tests_count = db_tests.count
    success_test_passages_count = TestPassage.all.where(is_finished: true, test_id: db_tests.ids, user_id: @user.id).count
    #badge = Badge.find(3)
    return true if success_test_passages_count >= db_tests_count
  end

  def language_tests_award?(badge)
    false
  end

  def hard_tests_award?(badge)
    false
  end

  def first_try_tests_award?(badge)
    success_test_passages_count = TestPassage.all.where(is_finished: true, test_id: @test.id, user_id: @user.id).count
    return true if (!@user.test_list.include?(@test.id) && success_test_passages_count < 2)
  end


end
# 1 | Framework
# 2 | Databases
# 3 | Low level languages
