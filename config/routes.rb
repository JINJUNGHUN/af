Rails.application.routes.draw do

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :post_attachments
  resources :posts

  root 'posts#index'

  get 'homes/index'
  get 'searches/result'
  get 'pages/about'
  get 'pages/mypage'
  get 'pages/ad'
  get 'pages/privacy'
  get 'pages/customer'
  get 'pages/rules'
  # 해시태그
  get '/posts/hashtag/:name', to: 'posts#hashtags'

  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  resources :comments, only: [:create, :destroy]

  # 항상 맨 아래에 위치시킴
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
