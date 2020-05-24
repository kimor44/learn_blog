Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: 'pages#home'

  get 'books' => 'books#index', as: 'books_index'
  post 'books' => 'books#create', as: 'books_create'
  get 'books/:id', to: 'books#show', as: 'books_show'
  patch 'books/:id', to: 'books#update', as: 'books_update'
  delete 'books/:id', to: 'books#destroy', as: 'books_destroy'

  get 'test' => 'pages#test'
  get 'castor' => 'pages#castor'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
