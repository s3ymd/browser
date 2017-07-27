Rails.application.routes.draw do
  get 'modules/:module', to: 'modules#show', constraints: {module: /[\w:]+/}
  get 'methods/search', to: 'methods#search'
  post 'methods/search', to: 'methods#search'
  root to: redirect('/modules/Object')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
