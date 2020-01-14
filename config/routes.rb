Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'weather#index'
      resources :users, only: :create
      resources :sessions, only: :create
      resources :backgrounds, only: :index
      resources :road_trip, only: :create
    end
  end
end
