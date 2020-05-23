Rails.application.routes.draw do
  get 'books' => 'books#index'
  get 'books/:id', to: 'books#show', as: 'books_show'
  patch 'books/:id', to: 'books#update', as: 'books_update'
  post 'books' => 'books#create'
  root 'pages#home'
  get 'test' => 'pages#test'
  get 'castor' => 'pages#castor'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
