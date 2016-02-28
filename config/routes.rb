Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: "user/registrations" }

  resources :users, only: [:show] do
    collection do
      post 'search'
    end
  end

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

  resources :friendships, only: [:show, :create, :destroy] do
    member do
      post 'accept'
    end
  end
  
  root 'welcome#index'
end
