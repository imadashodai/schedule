Rails.application.routes.draw do
  get 'users/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	post 'create_user', to: 'events#create_user'
	get 'event_token/:token', to: 'events#event_token', as: 'event_token'
	get 'create_user/:id/new', to: 'events#new_user', as: 'new_user'
	resources :events
end
