class AwardService

  def initialize(user)
    @badges = Badge.all
    @user = user
  end

  def award_user(user)
    @badges.each do |badge|
      @user.user_badges << badge.id if send("#{badge.rule}_award?", badge)
      @user.save!
    end
  end

  def databases_tests_award?(badge)
    db_tests = Test.all.where(category_id: 2)
    db_tests_count = db_tests.count
    success_test_passages_count = TestPassage.all.where(is_finished: true, test_id: db_tests.ids, user_id: @user.id).count
    badge = Badge.find(1)
    return true if success_test_passages_count >= db_tests_count
  end

  def framework_tests_award?(badge)
    false
  end

  def language_tests_award?(badge)
    false
  end


end
# 1 | Framework
# 2 | Databases
# 3 | Low level languages
