Chatter::Application.routes.draw do
    resources :users do
    resources :friendships, only: [:index, :show, :new, :create] do
      resources :posts, only: [:index, :create, :show, :new]
    end

    member do
      get :viewposts
    end
  end

  resource :session, only: [:new, :create, :destroy]

  root :to => "welcome#index"
end
