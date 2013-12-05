Manderley::Application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :edit, :show, :update]
  resources :adresses
  resources :movies do
    resources :comments, shallow: true

    get  :new_cast
    post :add_cast

    delete 'destroy_cast/:id', to: 'movies#destroy_cast'
    #get "/casts/new(.:format)", :action => "new_cast"
    #post "/casts/new(.:format)", :action => "add_cast", as: :create_movie_cast


    resources :casts, shallow: true
  end
  resources :people

  mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'movies#index'
  #post 'movies/:movie_id/add_cast' => 'movie#add_cast'

  get 'users', to: 'users#index'
  get 'profile', to: 'users#profile', as: :profile

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
