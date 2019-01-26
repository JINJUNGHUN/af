Rails.application.routes.draw do
  get 'homes/index'
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'searches/result'
  resources :post_attachments
  resources :posts

  root 'posts#index'

  get 'pages/about'

  resources :comments, only: [:create, :destroy]


end
