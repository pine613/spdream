Opac::Application.routes.draw do
  resources :child_categories

  resources :reviews do
    collection do
      get 'deleted'
      get 'request'
    end
  end
  resources :categories

  resources :tags do
    collection do
      get 'request'
    end
  end

  resources :books do
    collection do
      get 'deleted'
    end
  end
 post 'books/:id' => 'books#hide_and_restore'
 post 'reviews/:id' => 'reviews#hide_and_restore_approval'
 post 'tags/:id' => 'tags#approval'

  match "tops", :controller => :opac_tops, :action => :index ,:via => :GET
  match "tops/book", :controller => :opac_tops, :action => :index_book ,:via => :GET
  match "tops/book_info", :controller => :opac_tops, :action => :show_book ,:via => :GET
  match "tops/tag", :controller => :opac_tops, :action => :index_tag ,:via => :GET

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
 root :to => 'books#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
