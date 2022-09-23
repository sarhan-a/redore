Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show]
  root to: "pages#home"
  get '/about', to: "pages#about"
  get '/brands', to: "pages#brands"
  get '/facts', to: "pages#facts"
  get '/help', to: "pages#help"
  get '/live_sustainably', to: "pages#live_sustainably"
  get "error", to: "pages#error"

  resources :listings do
    resources :bookings, only: %i[new create show index]
    resources :collection_dates, only: %i[new create show index]
    resources :reviews, only: %i[new create]
  end
  resources :favorite_listings, only: %i[create destroy]
  get '*path', to: redirect("/error")
end
