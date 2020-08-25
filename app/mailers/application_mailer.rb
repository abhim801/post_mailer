class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def send_mail_posts(email, date)
    @email = email
    @date = date
    @posts = Post.active.where('DATE(created_at) = ?', @date)
    mail to: @email, subject: "Welcome to PostMailer!"
  end
end
