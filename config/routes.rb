Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/user' do
    post '/create', to: 'users#create'
    post '/sign-in', to: 'users#sign_in'
  end
  
  scope '/day' do
    get '/all', to: 'days#index'
    get '/:id', to: 'days#show'
    post '/create', to: 'days#create'
    delete '/:id', to: 'days#destroy'
  end

  scope '/booking' do
    get '/all', to: 'bookings#index'
    get '/:id', to: 'bookings#show'
    post '/create', to: 'bookings#create'
  end
end
