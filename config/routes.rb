Rails.application.routes.draw do
  resources :comments
  resources :watchlist_movies
  resources :users
  resources :watchlists
  resources :genres
  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
