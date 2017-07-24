Rails.application.routes.draw do
  root 'welcome#index'
  get 'sessions/create', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
