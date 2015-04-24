Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show, :destroy]

  resource :session, only: [:create, :new, :destroy]

  resources :bands do
    resources :albums, only: [:new, :index]
  end

  resources :albums, except: [:new] do
    resources :tracks, only: [:new]
  end

  resources :tracks, except: [:new, :index] do
    resources :notes, only: [:new]
  end

  resources :notes, except: [:new, :index, :edit, :update]

end
