class SmsController < ApplicationController
  def inbound
    contact = Contact.find_by number: params['From']
    pong = contact.pongs.create(
      body: params['Body']
    )

    head :ok, content_type: 'text/xml'
  end
end
