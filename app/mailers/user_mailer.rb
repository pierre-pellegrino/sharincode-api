class UserMailer < ApplicationMailer
  default from: 'snipshare.dev@outlook.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://snipshare.vercel.app/login'
    mail(to: @user.email, subject: 'Bienvenue sur Snipshare')
  end
end
