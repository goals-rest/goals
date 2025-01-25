Rails.application.routes.draw do
  root to: "homes#show"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  if Rails.env.development?
    mount Railsui::Engine, at: "/railsui"
    mount Lookbook::Engine, at: "/lookbook"
  end

  resource :session
  resources :passwords, param: :token
  resources :registrations, only: %i[new create]

  resource :home, only: %i[show]
  resources :goals, only: %i[index new create edit update destroy] do
    scope module: :goals do
      resource :update_progress, only: %i[edit update]
    end
  end
  resources :follows, only: %i[create destroy]
  resources :follow_requests, only: %i[index]
  namespace :settings do
    resource :profile, only: %i[edit update]
  end

  scope ":username", as: :profile, constraints: { username: /[a-zA-Z0-9\.]+/ } do
    get "/" => "profiles#show"

    scope module: :profiles do
      resources :followers, only: %i[index destroy]
    end
  end
end
