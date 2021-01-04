Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#show'
  get 'auth/github', as: 'github_login'
  get 'auth/:provider/callback', to: 'sessions#create'

  get 'dashboard', to: 'dashboard#show'

  get '/logout', to: 'sessions#destroy', as: :log_out
end
