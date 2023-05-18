Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#create'
  post '/signup', to: 'users#create'

  scope :api, defaults: { format: :json } do
    resource :user, only: %i[index]
    resources :tasks
    resources :notes
    resources :contacts
  end

end