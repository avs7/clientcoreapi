Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#create'
  post '/signup', to: 'users#create'

  resource :user, only: %i[index]
  resource :task

end
