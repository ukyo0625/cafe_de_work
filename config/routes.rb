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

    root "shops#top"
    get "shops/search" => "shops#search"
    resources :shops, only:[:index, :show]

    namespace :owners do
      resources :shops, only:[:index, :show, :create, :new, :edit, :update] do
      patch "shops/delete" => "shops#status"
      end
    end

    namespace :admins do
      resources :shops, only:[:index, :show, :destroy, :edit, :update] do
      get "shops/search" => "shops#search"
      end
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end