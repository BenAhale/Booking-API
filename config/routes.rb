Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/user/create', to: 'users#create'
  post '/user/sign-in', to: 'users#sign_in'
end
