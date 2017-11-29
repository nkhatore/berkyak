Rails.application.routes.draw do
	devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"

  post 'posts', to: 'posts#create', as: 'createpost'
	post 'posts/:id', to: 'posts#createcomment', as: 'createcomment'
  patch 'posts/:id', to: 'posts#vote', as: 'vote'
	get 'posts/search', to: 'posts#search', as: 'search'
	get 'posts/sortby', to: 'posts#sortby', as: 'sortby'

  patch 'comments/:id', to: 'comments#vote', as: 'vote_comm'

  get 'users/:id', to: 'users#show', as: 'showuser'

end
