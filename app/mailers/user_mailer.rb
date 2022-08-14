class UserMailer < ApplicationMailer
  default from: 'odin@railsFinal.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to My Site')
  end
end
