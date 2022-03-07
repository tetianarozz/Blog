class UserMailer < ActionMailer::Base
  default :from => "testd5025@gmail.com"

  def registration_confirmation
    @user = params[:user]
    mail(:to => "#{@user.first_name} <#{@user.email}>", :subject => "Registration Confirmation")
  end
end
