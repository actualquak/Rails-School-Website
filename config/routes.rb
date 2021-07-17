Rails.application.routes.draw do
  devise_scope :user do
    get "/signout", to: 'devise/sessions#destroy', as: :signout
    get "/signin", to: 'devise/sessions#new'
    get "/signup", to: 'devise/registrations#new'
  end
  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "articles#index"
  get "/index", to: "articles#index"
  get "/tour", to: "pages#tour"
  get "/map", to: "pages#map"
end
