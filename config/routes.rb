Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # nest the attendings routes under events to allow you to pass @event in the url to controller
  resources :events do
    post 'create_attendings', to: 'attendings#create'
    delete 'destroy_attendings', to: 'attendings#destroy'
    post 'create_invite', to: 'invites#create'
    delete 'destroy_invite', to: 'invites#destroy'
  end

  # sets url /my_events to show user's events
  get 'my_events', to: 'users#show'

  # Defines the root path route ("/")
  root "events#index"
end
