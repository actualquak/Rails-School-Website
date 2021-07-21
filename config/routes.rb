Rails.application.routes.draw do
  devise_scope :user do
    get "/users/sign_out", to: "devise/sessions#destroy", as: :signout
  end
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :articles
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "articles#index"
  get "/articles", to: "articles#index"
  get "/tour", to: "pages#tour"
  get "/map", to: "pages#map"
  get "/forum", to: "posts#index"
  resources :comments, only: [:index, :create, :update, :edit, :destroy]
  get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
end
