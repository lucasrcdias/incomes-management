Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, path: '/' do
    namespace :v1 do
      resources :users, only: :create
      resources :categories, except: [:new, :edit, :show]
      resources :entries, except: [:new, :edit, :show]

      get '/incomes', to: 'entries#incomes', as: :incomes
      get '/expenses', to: 'entries#expenses', as: :expenses

      post '/sessions/new', to: 'sessions#new', as: :new_session
    end
  end
end
