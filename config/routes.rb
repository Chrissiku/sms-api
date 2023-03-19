Rails.application.routes.draw do
  resources :sms, only: [:new, :create]
  root "sms#new"
end
