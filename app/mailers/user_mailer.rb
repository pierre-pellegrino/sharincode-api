class UserMailer < ApplicationMailer
  default from: 'noreply@snipshare.com'

  def welcome_email
    @user = current_user
    @url  = 'https://snipshare.vercel.app/login'
    mail(to: @user.email, subject: 'Bienvenue sur Snipshare')
  end
end
