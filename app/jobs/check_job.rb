require 'twilio-ruby'

class CheckJob < ApplicationJob
  def perform(dead_contacts)
    client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
    )

    Contact.all.each do |contact|
      dead_contacts.each do |dead_contact|
        client.messages.create(
          messaging_service_sid: ENV['TWILIO_MESSAGING_SERVICE_SID'],
          to: contact.number,
          body: "Someone check on #{dead_contact.number}!"
        )
      end
    end
  end
end
