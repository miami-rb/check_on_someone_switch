Rails.application.routes.draw do
  get 'inbound', to: 'sms#inbound'
end
