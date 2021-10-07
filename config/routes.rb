Rails.application.routes.draw do
  devise_for :members

  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'

  resources :advices, only: [:index, :show, :edit, :create, :update, :destroy] do
   resource :favorites, only: [:create, :destroy]
  end

  resources :members, only: [:index, :show, :edit, :update]
end
