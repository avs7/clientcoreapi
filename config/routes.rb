Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#create'
  resource :user, only: %i[index]

  post '/signup', to: 'users#create'

end
