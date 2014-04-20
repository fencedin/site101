Site101::Application.routes.draw do
  root to: 'main#index'
  devise_for :admins
  resources :main, only: [:index, :show]
  resources :wikis, except: [:new, :edit]
end
