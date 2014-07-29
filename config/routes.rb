Wifindr::Application.routes.draw do
  resources :saved_networks
  # resources :homes
  root to: "homes#index"

  devise_for :users, controllers: {registrations: :users}
  # devise_for :users, :controllers => { :registrations => "registrations" }

  devise_scope :user do
    resources :users, only: [:index, :show] do
      member do
        get :befriend
      end
    end
  end


  resources :friendships, only: [] do
    member do
      get :accept
      get :reject
    end
  end

end
