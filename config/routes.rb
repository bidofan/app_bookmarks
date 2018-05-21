Rails.application.routes.draw do
  get 'session/create'
  get 'session/destroy'
  get 'home/index'
  match 'auth/:provider/callback', to: 'session#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'session#destroy', as: 'signout', via: [:get, :post]
  root 'home#index'
end
