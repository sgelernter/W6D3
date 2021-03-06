Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  resources :users, only: [:index, :show, :update, :destroy, :create]
  resources :artworks, only: [:show, :update, :destroy, :create]
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy, :index]
  resources :collections, only: [:index]

  resources :users do 
    resources :artworks, only: [:index, :update]
    resources :comments, only: [:index]
    member do 
      patch 'favorite'
      get 'list_collection'
    end 
  end

  resources :artworks do 
    resources :comments, only: [:index]
  end

end


  # get 'users', to: 'users#index', as: 'users'
  # get 'users/:id', to: 'users#show', as: 'user'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # post 'users', to: 'users#create'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

