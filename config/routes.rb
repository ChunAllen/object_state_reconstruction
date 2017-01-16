Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'object_states#index'

	resources :object_states, only: [:index, :create]

end
