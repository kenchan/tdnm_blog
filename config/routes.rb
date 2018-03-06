Rails.application.routes.draw do
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  root 'articles#index'

  resources :articles, only: %w(index show)
  get '/atom.xml', controller: 'articles', action: 'index', format: 'atom'
  get '/:year/:month/:day/:title', to: 'articles#show', year: /\d{4}/, month: /\d{2}/, day: /\d{2}/
  get '/blog/:year/:month/:day/:title', to: 'articles#show', year: /\d{4}/, month: /\d{2}/, day: /\d{2}/
end
