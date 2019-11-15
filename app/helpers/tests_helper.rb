module TestsHelper

  def question_count
    @tests.count
  end

  def finished?
    test.test_passage.is_finished
  end
end
