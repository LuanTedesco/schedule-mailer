Rails.application.routes.draw do
  resources :emails
  devise_for :users, skip: [:registrations]
  root "emails#index"
end
