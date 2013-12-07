class SignupMailer < ActionMailer::Base
  default from: "quickrails@gmail.com"
  def signup_confirmation(user)
  	@user = user
  	mail(:to => (user.login_email), :subject => "Welcome to OpenSpace")
  end

  def random_password_send(user,password)
  	@user = user
  	@password = password
  	mail(:to => (user.login_email), :subject => "Your new password...")
  end

  def reset_password_confirmation(user)
    @user = user
    
    mail(:to => (user.login_email), :subject => "Your password has been reset...")
  end
end
