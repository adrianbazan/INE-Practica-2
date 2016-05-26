# Preview all emails at http://localhost:3000/rails/mailers/notifier
class NotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifier/password_reset_instructions
  def password_reset_instructions
    Notifier.password_reset_instructions
  end

end
