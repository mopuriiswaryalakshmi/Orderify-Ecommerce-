# Preview all emails at http://localhost:3000/rails/mailers/noification
class NoificationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/noification/newuser
  def newuser
    Noification.newuser
  end

end
