require 'api_constraints'

Rails.application.routes.draw do


  resources :jobs
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1,
      constraints: ApiConstraints.new(version: 1, default: true) do
        resources :users, :only => [:show, :create, :update, :destroy]
        post 'user_token' => 'user_token#create'
        resources :home, :only => [:index]
      end
  end
end
