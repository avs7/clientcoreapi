Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    post '/auth/login', to: 'authentication#create'
    post '/signup', to: 'users#create'

    resource :user, only: %i[index]
    resources :tasks
    resources :notes
    resources :contacts
  end

end