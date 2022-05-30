Rails.application.routes.draw do
  namespace :app_tools do
    get "styles/index"
    get "styles/tailwindcss"
  end

  get "home/index"
  root "home#index"

  namespace :app_tools do
    resources :mains, only: [:index]
  end

  get "app_tools", to: "app_tools/mains#index"
  get "tools", to: "app_tools/mains#index"
  get "styles", to: "app_tools/styles#index"
end
