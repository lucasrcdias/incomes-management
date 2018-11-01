Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, path: '/' do
    namespace :v1 do
      resources :users, only: :create do
        get '/me', action: 'me', on: :collection
      end

      resources :categories, except: [:new, :edit, :show]
      resources :entries, except: [:new, :edit, :show, :index]

      get '/dashboard',     to: 'dashboard#index', as: :dashboard
      post '/sessions/new', to: 'sessions#new',    as: :new_session
    end
  end
end
