class TestPassage < ApplicationRecord




  SUCCESS_RATE = 85
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  # коллбэк нужен для того чтобы при создании объекта прохождения теста
  # первый вопрос уже имел значение, существовал для TestPassage
  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question_to_current, on: :update
  # before_validation :before_validation_build_questions_index_in_test

  def success?(rate)
    if rate >= SUCCESS_RATE
      self.update(is_finished: true)
      badge_to_user
    end
  end

  def badge_to_user
    # проверить массив test_list у пользователя
    user_tests = user.test_list
    @badges_array = Badge.all
    @badges_array.each do |badge|
      # сравнить массив с требованиями к значку - сравнить массивы (тесты из одной категории например)
     if badge.criteria && user_tests == badge.criteria
       user.user_badges << badge.id
       user.save
     end
   end
    # если совпало - то добавить в user_badges << badge.id
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    #self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  # def before_validation_build_questions_index_in_test
  #   questions_in_test = test.questions
  # end
  def question_number
    test.questions.where('questions.id <= ?', current_question.id).count
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question_to_current
    self.current_question = next_question if self.current_question
  end


  # получили обьект correct_answers, используем count - только тогда получаем из агрегирующего запроса количество правильных ответов
  # == справа мы используем фильтр .where(id: answer_ids) - то есть те ответы, на которые ответил пользователь.
  # Здесь answer_ids - массив, который вернули чекбоксы, которые отметил пользователь.
  def correct_answer?(answer_ids)
    if answer_ids
      correct_answers.count == (correct_answers.where(id: answer_ids).count) && correct_answers.count == answer_ids.count
    else
      correct_answers.count == 0
    end
  end

  # здесь мы используем scope :correct (определенный в модели Answer)
  # то есть выбираем только правильные ответы. Получаем обьект ActiveRecord::Relation
  # запроса к базе как такового нет.
  def correct_answers
    current_question.answers.correct
  end

  # после того как выбрали все вопросы у которых id больше чем id текущего вопроса - мы выбираем из них первый,
  # это и будет следующий вопрос. (Знак вопрос - из ранее пройденого, передаем current_question.id неявно, предотвр. sql injections)
  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
