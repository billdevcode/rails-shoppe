class ExampleMailer < ApplicationMailer

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'This is a sample email')
  end

  #  def sample_email(user)
  #   @user = user
  #   mg_client = Mailgun::Client.new 'key-fbc9793a348df771ae02f357b45e8c45'
  #   message_params = {from: "taodav199501@gmail.com",
  #                     to: @user.email,
  #                     subject: 'Sample Mail using Mailgun API',
  #                     text: 'This mail is sent using Mailgun API via mailgun-ruby'}
  #   mg_client.send_message 'sandboxdecd5e95c1924f9d9faa1d224f2e53a0.mailgun.org', message_params
  # end


end
