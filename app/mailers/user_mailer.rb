class UserMailer < Devise::Mailer
  default from: 'snipshare.dev@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://snipshare.vercel.app/login'
    mail(to: @user.email, subject: 'Bienvenue sur Snipshare')
  end

  def reset_password_instructions(record, token, opts={})
    super
  end
end
