Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show]
  root to: "pages#home"
  resources :listings do
    resources :bookings, only: %i[new create show index]
    resources :collection_dates, only: %i[new create show index]
    resources :reviews, only: %i[new create]
  end
end
