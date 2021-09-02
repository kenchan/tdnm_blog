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

  get '/atom.xml', controller: 'articles', action: 'index', format: 'atom'
  get '/:year/:month/:day/:slug', to: 'articles#show', year: /\d{4}/, month: /\d{2}/, day: /\d{2}/
  get '/blog/:year/:month/:day/:slug', to: redirect('/%{year}/%{month}/%{day}/%{slug}')

  namespace :amp do
    get '/:year/:month/:day/:slug', to: 'articles#show', year: /\d{4}/, month: /\d{2}/, day: /\d{2}/
  end

  get '/:title', to: 'articles#show', as: :article

end
