CV::Application.routes.draw do
  resources :papers
  resources :tags, :only => [:index, :destroy]
 map.update_tags '/tags', :controller => 'tags', :action => 'update', :conditions => { :method => :put }
 map.with_options :controller => 'display', :conditions => { :method => :get } do |p|
   p.publications 'publications', :action => 'publications'
   p.tagged 'tagged/:id', :action => 'tagged'
   p.bibtexall 'bibtexall', :action => 'bibtexall'
   p.recent 'recent', :action => 'recent'
   p.cv 'cv', :action => 'cv'
   p.bibtex 'bibtex/:id', :action => 'bibtex'
 end
 map.login '/login', :controller => 'session', :action => 'login', :conditions => { :method => :get }
 map.logout '/logout', :controller => 'session', :action => 'logout', :conditions => { :method => :get }
 map.admin '/admin', :controller => 'admin', :action => 'index', :conditions => { :method => :get }

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
