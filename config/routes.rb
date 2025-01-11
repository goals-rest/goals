Rails.application.routes.draw do
  if Rails.env.development?
    mount Railsui::Engine, at: "/railsui"
  end

  root to: "rails/welcome#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
