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

      resources :goal_progress_changes, only: %i[], path: :progress_changes do
        scope module: :progress_changes do
          resources :posts, only: %i[new create]
        end
      end
    end
  end
  resources :posts, only: %i[new show create]
  resources :entries, only: %i[] do
    scope module: :entries do
      resources :likes, only: %i[index]
      resource :like, only: %i[create destroy]
      resources :comments, only: %i[index new create]
    end
  end
  resources :notifications, only: %i[index destroy]
  resource :read_all_notifications, only: %i[update]
  resources :follows, only: %i[create destroy]
  resources :follow_requests, only: %i[index destroy] do
    scope module: :follow_requests do
      resources :accept_follow_requests, only: %i[create]
    end
  end
  namespace :settings do
    resource :profile, only: %i[edit update]
  end
  resources :feed, only: %i[index]

  scope ":username", as: :profile, constraints: { username: /[a-zA-Z0-9\.]+/ } do
    get "/" => "profiles#show"

    scope module: :profiles do
      resources :followers, only: %i[index destroy]
      resource :follow_request, only: %i[create destroy]
      resources :goals, only: %i[show index]
      resources :feed_entries, only: %i[destroy]
      resources :goal_progress_changes, only: %i[index], path: :progress_changes
    end
  end

  # Entryables without show page will redirected to the home page
  get "comments/:id" => "homes#show", as: :comment
end
