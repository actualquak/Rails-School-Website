Rails.application.routes.draw do
  devise_scope :user do
    get "/signout", to: 'devise/sessions#destroy', as: :signout
    get "/signin", to: 'devise/sessions#new'
    get "/signup", to: 'devise/registrations#new'
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get "/index", to: "pages#index"
  get "/tour", to: "pages#tour"
end
