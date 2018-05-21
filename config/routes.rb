Rails.application.routes.draw do
  get 'session/create'
  get 'session/destroy'
  get 'home/index'
  root 'home#index'
end
