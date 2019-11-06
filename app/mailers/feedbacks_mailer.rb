class FeedbacksMailer < ApplicationMailer

  def feedback_mail(user, feedback_mail)
    @user = user
    @feedback = feedback_mail

    mail to: @user.email, subject: 'New feedbck was created'

  end
end
