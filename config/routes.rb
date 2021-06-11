Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :comments
      resources :watchlist_movies
      resources :users
      resources :watchlists
      resources :genres
      resources :movies
    end
  end

end
