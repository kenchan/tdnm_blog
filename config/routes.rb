Rails.application.routes.draw do
  root 'articles#index'

  resource :session, only: [:new, :create, :destroy]
  resources :articles, only: %w(index show)
  get '/atom.xml', controller: 'articles', action: 'index', format: 'atom'
  get '/:year/:month/:day/:title', to: 'articles#show', year: /\d{4}/, month: /\d{2}/, day: /\d{2}/
  get '/blog/:year/:month/:day/:title', to: 'articles#show', year: /\d{4}/, month: /\d{2}/, day: /\d{2}/

  namespace 'admin' do
    resource 'dashboard', only: %w(show)
    resources 'articles', only: %w(new create)
  end
end
