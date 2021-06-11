Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :user_movies
      resources :genres
      resources :users do
        resources :watchlists
      end
      resources :watchlists
      resources :movies do 
        resources :comments, only: [:index, :show]
      end
      resources :comments
    end
  end

end
