# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category1 = Category.create(id: 102, title: 'Framework')

category1.save
category2 = Category.create(id: 103, title: 'Low lewel languages')
category3 = Category.create(id: 104, title: 'Databases')

user1 = User.new(id: 101, email: 'vasya@gmail.com', type: 'User', password: '111111', first_name: 'Vasiliy', last_name: 'Pupkov')
user2 = User.new(id: 102, email: 'lily@gmail.com', type: 'Admin', password: '111111', first_name: 'Lily', last_name: 'Angery')

test1 = Test.new(id: 101, title: 'Ruby on Rails', level: 5, category_id: 101, author_id: 101)
test2 = Test.new(id: 102, title: 'Assembler', level: 9, category_id: 102, author_id: 101)
test3 = Test.new(title: 103, title: 'Sqlite', level: 1, category_id: 103, author_id: 102)

question1 = Question.new(title: 'What model Ruby on Rails use?', test_id: 1)
question2 = Question.new(title: 'What methods use RoR for adding example data?', test_id: 1)
question3 = Question.new(title: 'What most popular gems use in Ruby on Rails?', test_id: 1)
question4 = Question.new(title: 'Assembler most use for?', test_id: 2)
question5 = Question.new(title: 'Assembler is crossplatform language?', test_id: 2)
question6 = Question.new(title: 'What is Sqlite?', test_id: 3)
question7 = Question.new(title: 'What expression use in Sqlite for update column?', test_id: 3)
question8 = Question.new(title: 'What most popular uses of Sqlite?', test_id: 3)

answer1 = Answer.new(body: 'Ruby on Rails use MVC model', correct: true, question_id: 1)
answer2 = Answer.new(body: 'Ruby on Rails not use model', correct: false, question_id: 1)
answer3 = Answer.new(body: 'Ruby on Rails is most popular database', correct: false, question_id: 1)

answer4 = Answer.new(body: 'Method :post in views', correct: false, question_id: 2)
answer5 = Answer.new(body: 'RoR have not methods for this', correct: false, question_id: 2)
answer6 = Answer.new(body: 'Ruby on Rails use seeds file for it', correct: true, question_id: 2)

answer7 = Answer.new(body: 'Ruby on Rails not used gems', correct: false, question_id: 3)
answer8 = Answer.new(body: 'Most popular gems in Ruby on Rails is devise, pg', correct: false, question_id: 3)
answer9 = Answer.new(body: 'Method :post in views', correct: false, question_id: 3)
