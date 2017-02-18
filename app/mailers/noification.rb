class Noification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.noification.newuser.subject
  #
  def newuser(user)
  	@user = user

    

    mail to: "#{@user.email}"
  end
end
