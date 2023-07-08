Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :urls, only: [:new, :create, :show]
  get '/:short_url', to: 'urls#redirect', as: 'short_url_redirect'
  root to: 'urls#new'
end
