Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :events
  resources :attendings

  # sets url /my_events to show user's events
  get 'my_events', to: 'users#show'

  # Defines the root path route ("/")
  root "events#index"
end
