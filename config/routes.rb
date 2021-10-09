Rails.application.routes.draw do
  devise_for :members

  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources :advices, only: [:index, :show, :edit, :create, :update, :destroy] do
   resource :favorites, only: [:create, :destroy]
   resource :advice_comments, only: [:create, :destroy]
  end

  resources :members, only: [:index, :show, :edit, :update] do
   resource :relationships, only: [:create, :destroy]
   # post 'relationships/:member_id' => 'relationships#create', as: 'relationships'
   # delete 'relationships/:member_id' => 'relationships#destroy', as: 'relationships'
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers' => 'relationships#followers', as: 'followers'
  end
end
