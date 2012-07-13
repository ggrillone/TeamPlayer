TeamPlayer::Application.routes.draw do
  resources :users

  root to: 'static_pages#home'

  match '/help', to: 'static_pages#help'

  match '/signup', to: 'users#new'
end
