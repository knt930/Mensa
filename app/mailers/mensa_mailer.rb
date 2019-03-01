class MensaMailer < ApplicationMailer
  def open
    @url = "https://mensa.jp/exam/"
    mail(to: ENV['EMAIL_ADDRESS'], subject: "MENSAからの招待状")
  end
end
