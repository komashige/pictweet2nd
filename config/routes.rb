Rails.application.routes.draw do
 
  devise_for :users
  root to: 'tweets#index'
  resources :tweets do
    resources :comments, only: [:create, :new]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end

