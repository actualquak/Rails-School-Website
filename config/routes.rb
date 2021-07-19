Rails.application.routes.draw do
  devise_scope :user do
    get "/signout", to: 'devise/sessions#destroy', as: :signout
    get "/signin", to: 'devise/sessions#new'
    get "/new-profile", to: 'devise/registrations#new'
    get "/edit-profile", to: 'devise/registrations#edit'
    get "/delete-profile", to: 'devise/registrations#destroy'
  end
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :articles do
    resources :article_comments
  end
  resources :posts do
    collection do
      get 'hobby'
      get 'study'
      get 'team'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "articles#latest"
  resources :articles do
    resources :comments
  end
  resources :comments do
    resources :comments
  end
  get "/articles", to: "articles#index"
  get "/tour", to: "pages#tour"
  get "/map", to: "pages#map"
  get "/forum", to: "pages#forum"
end
