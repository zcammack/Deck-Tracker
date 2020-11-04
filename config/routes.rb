Rails.application.routes.draw do
  get '/', to: 'pages#index'
  post '/', to: 'pages#index'
  resource :cards
  resource :decks
  resource :users
end
