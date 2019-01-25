Rails.application.routes.draw do
  get 'homes/index'
  devise_for :users
  get 'searches/result'
  resources :post_attachments
  resources :posts

  root 'posts#index'

  get 'pages/about'
  
end
