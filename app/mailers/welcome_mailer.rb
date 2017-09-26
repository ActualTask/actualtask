class WelcomeMailer < ApplicationMailer

  def welcome_send(user)
    @user = user
    mail to: user.email, sebjuct: "Подтвердите свой мейл"

  end

end
