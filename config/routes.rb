W2lProto::Application.routes.draw do
  
  #omniauth and session controller routes:
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get "signout" => "sessions#destroy", as: "signout"
  
  #users controller routes:
  get "/users/:id" => "users#show", as: "user"
  post "checkin" => "users#check_in", as: "check_ins"
  get "currentuser/checkins" => "users#current_user_check_ins"
  
  #tags controller routes:
  get "tags/index", as: "tags"
  post "liketag" => "tags#like", as: "likes"
  post "disliketag" => "tags#dislike", as: "dislikes"
  delete "like/:id" => "tags#unlike", as: "like"
  delete "dislike/:id" => "tags#undislike", as: "dislike"
  
  #locality controller routes:
  get "localities/index", as: "localities"
  get "locality/:name" => "localities#show", as: "locality"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#index'

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
