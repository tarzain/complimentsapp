class Notifier < ActionMailer::Base
  default :from => "complimentsapp@gmail.com"

  # send a signup email to the user, pass in the user object that contains the user's email address
  def signup_email(user)
    mail( 
    :to => user.email,
    :subject => "Thanks for creating an account. Check it out "+link_to("here", user_url(@user))
    )
  end
  def notif_email(user, message)
    debugger
    mail( 
    :to => user.email,
    :subject => "You received an anonymous compliment!",
    :body=>"Check it out "+ActionController::Base.helpers.link_to("here", message_url(message))
    )
  end
end
