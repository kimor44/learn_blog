Rails.application.routes.draw do
  get 'books' => 'books#index'
  post 'books' => 'books#create'
  root 'pages#home'
  get 'test' => 'pages#test'
  get 'castor' => 'pages#castor'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
