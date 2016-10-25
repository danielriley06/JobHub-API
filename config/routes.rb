require 'api_constraints'
require 'subdomain_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1,
      constraints: ApiConstraints.new(version: 1, default: true) do
        get '/users/current-user', to: "current_user#show"
        resources :users, :only => [:show, :create, :update, :destroy]
        post '/login', to: "sessions#create"
        resources :jobs
      end
  end
end
