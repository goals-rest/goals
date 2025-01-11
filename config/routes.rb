Rails.application.routes.draw do
  root to: "rails/welcome#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  if Rails.env.development?
    mount Railsui::Engine, at: "/railsui"
    mount Lookbook::Engine, at: "/lookbook"
  end
end
