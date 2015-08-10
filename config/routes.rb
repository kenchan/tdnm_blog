Rails.application.routes.draw do
  root 'articles#index'

  get ':year/:month/:day/:title', to: 'articles#show', year: /\d{4}/, month: /\d{2}/, day: /\d{2}/
end
