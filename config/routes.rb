Rails.application.routes.draw do

  get  'posts/new'
  get  'posts/create'
  get  'posts/index'
  get  'posts/show'
  root 'posts#index'
  get  '/help',            to:   'static_pages#help'
  get  '/about',           to:   'static_pages#about'
  get  '/contact',         to:   'static_pages#contact'
  post 'posts/new',        to:   'posts#create'
  post 'comments/new',     to:   'comments#create'
  post 'friendships/new',  to:   'friendships#create'
  
  resources  :posts,       only: [:new, :create, :index, :show]
  resources  :user,        only: [:show, :index]
  resources  :comments,    only: [:new, :create, :destroy]
  resources  :postlikes,   only: [:new, :create, :destroy]
  resources  :friendships, only: [:new, :create, :destroy, :edit, :index]
  resources  :commentlike, only: [:new, :create, :destroy]
  resources  :posts do
    resources  :comments,  only: [:new, :create, :destroy]
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
