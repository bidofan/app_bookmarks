Rails.application.routes.draw do
  get 'session/create'
  get 'session/destroy'
  get 'home/index'
  get 'auth/:provider/callback', to: 'session#create', via: [:get, :post]
  get 'auth/failure', to: redirect('/'), via: [:get, :post]
  get 'signout', to: 'session#destroy', as: 'signout', via: [:get, :post]
  resources :bookmarks
  root 'home#index'
end
