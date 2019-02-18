Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  root 'articles#index'

  resources :articles, only: %w(index show)
  get '/atom.xml', controller: 'articles', action: 'index', format: 'atom'
  get '/:year/:month/:day/:slug', to: 'articles#show', year: /\d{4}/, month: /\d{2}/, day: /\d{2}/
  get '/:year/:month/:day', to: 'articles#list', year: /\d{4}/, month: /\d{2}/, day: /\d{2}/
  get '/:year/:month', to: 'articles#list', year: /\d{4}/, month: /\d{2}/
  get '/:year', to: 'articles#list', year: /\d{4}/
  get '/blog/:year/:month/:day/:slug', to: redirect('/%{year}/%{month}/%{day}/%{slug}')

  namespace :amp do
    get '/:year/:month/:day/:slug', to: 'articles#show', year: /\d{4}/, month: /\d{2}/, day: /\d{2}/
  end
end
