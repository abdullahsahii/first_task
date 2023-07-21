require 'base32'

class TwoFactorMailer < ApplicationMailer
  # def initialize(email)
  #   @email = email
  #   @secret = Base32.random_base32(16)
  # end



  def send_otp
    Twilio.connect(Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token)
    otp = generate_otp # Generate the one-time password using the generate_otp method
    message = Twilio::Message.new(to: email, # Use instance variable @email
                                  from: Rails.application.secrets.twilio_email,
                                  body: "Your one-time password is #{otp}")
    message.save
  end

  def verify_otp()
    Rotp.new(@secret).verify()
  end

  private
  def generate_otp
    @secret = Base32.random_base32(16)
    Rotp.new(@secret).now
  end


end
