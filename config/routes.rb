Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :events do
    collection do
      post 'search'
    end
  end 
  resources :attendances, only: [:create, :destroy] do
    member do
      post 'accept'
    end
  end
  
  root 'welcome#index'
end
