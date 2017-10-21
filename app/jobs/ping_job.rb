require 'twilio-ruby'

class PingJob < ApplicationJob
  def perform
    client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
    )

    Contact.all.each do |contact|
      client.messages.create(
        messaging_service_sid: ENV['TWILIO_MESSAGING_SERVICE_SID'],
        to: contact.number,
        body: "Got a sec to check-in? Reply OK"
      )
    end
  end
end
