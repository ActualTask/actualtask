class UserMailer < ApplicationMailer
  default from: 'notifications@task.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/ru/users/sign_up'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
