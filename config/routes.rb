Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
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
