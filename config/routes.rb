Rails.application.routes.draw do
  get 'home', to: 'homes#top'
  root 'homes#top'
  get '/recipes', to: 'recipes#index'
  resources :histories
  resources :recipes, only: [:index, :new, :create]

end
