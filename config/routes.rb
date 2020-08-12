Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'home/index'
  root to: 'pages#home'

  get 'books' => 'books#index', as: 'books_index'
  post 'books' => 'books#create', as: 'books_create'
  get 'books/:id', to: 'books#show', as: 'books_show'
  patch 'books/:id', to: 'books#update', as: 'books_update'
  delete 'books/:id', to: 'books#destroy', as: 'books_destroy'

  get 'manage', to: 'manage#index', as: 'manage_index'
  get 'manage/first_page', to: 'manage#first_page', as: 'manage_first_page'
  get 'manage/new_first_page', to: 'manage#new_first_page', as: 'manage_new_first_page'
  post 'manage/create_first_page', to: 'manage#create_first_page', as: 'manage_create_first_page'

  resources :articles, path: '/manage/articles'

  get 'blog', to: 'blog#index', as: 'blog_index'
  get 'blog/:id', to: 'blog#show', as: 'blog_show'

  get 'test' => 'pages#test'
  get 'castor' => 'pages#castor'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
