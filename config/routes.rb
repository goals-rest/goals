Rails.application.routes.draw do
  root to: "homes#show"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resource :session
  resources :passwords, param: :token
  resources :registrations, only: %i[new create]

  resource :home, only: %i[show]
  resources :goals, only: %i[index new create ]

  if Rails.env.development?
    mount Railsui::Engine, at: "/railsui"
    mount Lookbook::Engine, at: "/lookbook"
  end
end
