class VerifyPongJob < ApplicationJob
  queue_as :default

  def perform
    sleep 15

    ping = Ping.order(created_at: :desc).first

    dead_contacts = Contact.all.select do |contact|
      contact.pongs.by_date(ping.created_at, Time.zone.now).blank?
    end

    CheckJob.perform_later(dead_contacts)
  end
end
