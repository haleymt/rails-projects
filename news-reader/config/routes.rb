NewsReader::Application.routes.draw do
  namespace :api do
    resources :feeds do
      resources :entries, only: [:index]
    end
    resources :users
  end

  root to: "static_pages#index"
end
