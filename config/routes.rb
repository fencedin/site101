Site101::Application.routes.draw do
  root to: 'wiki#index'
  devise_for :admins
  resources :wiki
end
