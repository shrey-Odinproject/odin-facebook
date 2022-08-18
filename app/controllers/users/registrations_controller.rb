class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    UserMailer.with(user: @user).welcome_email.deliver_later if @user.persisted?
  end
end
