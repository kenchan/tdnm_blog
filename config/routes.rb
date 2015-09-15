Rails.application.routes.draw do
  root 'articles#index'

  resources :articles, only: %w(index show)
  get '/atom.xml', controller: 'articles', action: 'index', format: 'atom'
  get ':year/:month/:day/:title', to: 'articles#show', year: /\d{4}/, month: /\d{2}/, day: /\d{2}/
end
