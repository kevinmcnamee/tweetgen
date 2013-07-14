Frothly::Application.routes.draw do

	resources :users do 
		resources :terms
		resources :campaigns do 
			get 'favorite', on: :member
		end
	end

	match '/search', to: 'public#search', as: :search
  
  root to: 'public#index'
  
	match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'logout', to: 'sessions#destroy', as: 'logout'

end
