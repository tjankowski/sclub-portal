# -*- encoding : utf-8 -*-
Motobi::Application.routes.draw do

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
  match '/signup' => 'users#new', :as => :signup
  match '/login' => 'sessions#new', :as => :login
  match '/logout' => 'sessions#destroy', :as => :logout
  match '/activate/:id' => 'accounts#show', :as => :activate
  match '/forgot_password' => 'passwords#new', :as => :forgot_password
  match '/reset_password/:id' => 'passwords#edit', :as => :reset_password
  match '/change_password' => 'accounts#edit', :aS => :change_password

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :clubs do
    collection do
      get :auto_complete
    end
  end

  resources :shoutboxes

  resources :cards

  resources :goals

  resources :sponsors

  resources :appearances do
    resources :goals,:cards
    member do
      post :rate
    end
    collection do
      post :sort
    end
  end

  resources :staff_teams

  resources :teams do
    collection do
      get :auto_complete
    end
  end

  resources :staffs

  resources :matches do
    resources :appearances
    resource :live_broadcasts
  end

  resources :galleries

  resources :entries

  resources :photos

  resources :players do
    collection do
      get :auto_complete
    end
  end

  resources :pages

  resources :users do
    resource :account
    resources :roles
    member do
      put :enable
    end
  end

  resource :session
  resource :password
  resources :roles
  resources :broadcast_messages
  resources :comments

  resources :articles do
    resources :comments
    collection do
      get :all
      get :website
    end
  end

 resources :live_broadcasts do
   resources :broadcast_messages
   member do
     get :first_half_start
     get :second_half_start
     get :reset_start
     get :start_next_status
     get :next_status
     get :last_status
   end
 end

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  root  :to => 'site#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  match ':controller(/:action(/:id))(.:format)'
end
