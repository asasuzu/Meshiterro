Rails.application.routes.draw do
 
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about' , as: 'about'

  
  resources :post_images, only:[:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    # post_image_post_comments POST   /post_images/:post_image_id/post_comments(.:format)     post_comments#create
  
  end
  
  resources :users, only:[:show, :edit, :update]
 
  end

