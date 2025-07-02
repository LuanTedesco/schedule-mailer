Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  root "emails#index"
  resources :emails do
    collection do
      get :boost_email_body
      get :fix_errors_body
    end
  end
  resources :users, only: %i[new create show index edit update destroy]
end
