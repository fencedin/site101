Site101::Application.routes.draw do
  root to: 'main#index'
  devise_for :admins
  resources :main, only: [:index, :show]
  resources :wikis, except: [:new, :edit] do
    resources :comments, only: [:create]
  end
  resources :tags, only: [:index, :create, :update, :destroy]
end
