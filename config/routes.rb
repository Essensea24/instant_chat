Rails.application.routes.draw do
  resources :controllers
resources :meetings
resources :friendships

 # get "friendships" => "friendships#index", as: :friendships
 # get "friendships/new" => "friendships#new", as: :new_friendship
 # get "friendships/:id" => "friendships#show", as: :friendship
 # post "friendship" => "friendships#create"
 # get "users/:id/friendships/:id/edit" => "friendship#edit", as: :edit_friendship
 # patch "friendships/:id" => "friendships#update", as: :update_friendship
 # delete "friendships/:id" => "friendships#destroy"

devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
 
 root "statics#home"
  get 'users/index' => "users#index", as: :users
  get 'users/:id' => "users#show", as: :user




  
  



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
