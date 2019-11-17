class AwardService

  def award_user
    Badge.all do |badge|
      badgerule = badge.rule
      current_user.user_badges << badge.id if send("#{badgerule.to_a}_award?", badge)
      current_user.save
    end
  end

  def databases_tests_award?
    db_tests = Test.all.where(category_id: 2)
    db_tests_count = db_tests_count
    user = current_user
    success_test_passages_count = TestPassage.all.where(is_finished: true, test_id: db_tests.ids, user_id: user.id)
    badge = Badge.find(1)
    return badge if success_test_passages_count >= db_tests_count
    c
  end

  def framework_tests_award?

  end

  def language_tests_award?

  end


end
# 1 | Framework
# 2 | Databases
# 3 | Low level languages
