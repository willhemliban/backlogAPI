Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :games
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # authentication igdb
  post "/igdb-authenticate" => "igdb#authenticate"

  # add games from igdb to database
  get "/igdb-add-games" => "igdb#add_games"

  # search games from igdb
  get 'igdb/search/:search_term', to: 'igdb#search_game'

  # Defines the root path route ("/")
  # root "posts#index"
end
