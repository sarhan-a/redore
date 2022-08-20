Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :listings do
    resources :bookings, only: %i[new create show index]
    resources :collection_dates, only: %i[new create show index]
  end
end
