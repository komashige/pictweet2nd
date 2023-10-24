Rails.application.routes.draw do
  get 'posts/index'
  devise_for :users
  root to: 'posts#index'
  resources :tweets do
    resources :comments, only: [:create, :new]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end

