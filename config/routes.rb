Rails.application.routes.draw do
	devise_for :users
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  post 'posts', to: 'posts#create', as: 'createpost'
  patch 'posts/:id', to: 'posts#vote', as: 'vote'
  post 'posts/:id', to: 'posts#createcomment', as: 'createcomment'

  get 'users/:id', to: 'users#show', as: 'showuser'
	


end
