require 'twilio-ruby'

class TestJob < ApplicationJob
  def perform
    client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
    )

    Contact.all.each do |contact|
      client.messages.create(
        messaging_service_sid: ENV['TWILIO_MESSAGING_SERVICE_SID'],
        to: "+1#{contact.number}",
        body: "PLS RESPOND"
      )
    end
  end
end
