class NotifierMailer < ApplicationMailer
  def notify
    mail(to: "abdullahsahi4321@outlook.com", subject: "Post is added")
  end
end
