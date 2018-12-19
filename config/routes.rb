Rails.application.routes.draw do
  get 'sessions/new'

  root 'statique#accueil'
  get '/contact', to: "statique#contact"
  get '/team', to: "statique#team"
  get '/services', to: "statique#services"
  get '/signup', to: "utilisateurs#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :utilisateurs

end
