Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :events do
    collection do
      post 'search'
    end
  end 
  resources :attendances, except: [:show, :edit, :update]
  
  root 'welcome#index'
end
