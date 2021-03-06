Rails.application.routes.draw do
	  scope module: :admins do
      devise_for :admins
    end

    scope module: :owners do
      devise_for :owners
    end

    get "admins/top" => "admins/homes#top"

    patch "owners/leave" => "owners#leave"
    get "owners/confirm" => "owners#confirm"
    resources :owners, only:[:edit, :update]

    namespace :admins do
      resources :owners, only:[:index, :show, :edit, :update]
    end


    namespace :owners do
      resources :shops, only:[:index, :show, :create, :new, :edit, :update] do
      end
    end

    namespace :admins do
      resources :shops, only:[:index, :show, :destroy, :edit, :update] do
      get 'search' , on: :collection
      end
    end
    root "shops#top"
    get "shops/search" => "shops#search"
    resources :shops, only:[:index, :show]

    namespace :api do
      namespace :v1 do
        resources :lines, only: :index
      end
    end

    namespace :api do
      namespace :v1 do
        resources :stations, only: :index
      end
    end

end