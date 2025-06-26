Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  root "emails#index"
  resources :emails
end
