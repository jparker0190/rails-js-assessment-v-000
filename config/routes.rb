Rails.application.routes.draw do
  resources :stocks
  resources :portfolios do
   resources :assignments
  end
  resources :assignments
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get '/stocks/:id/ticker', to: 'stocks#ticker'
  get '/stocks/:id/price', to: 'stocks#price'
end
