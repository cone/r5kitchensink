Rails.application.routes.draw do
  # -------- Concerns ---------
    # concern :commentable do
      # resources :comments
    # end
    
    # concern :image_attachable do
      # resources :image_attachments, only: :index
    # end

    # resources :auctions, concerns: [:commentable, :image_attachable] do
      # resources :bids
    # end

    # resources :bids, concerns: :commentable
  #----------------------------


  # Creates nested resources e.g. brands/1/products/4, and helpers like brands_products_path
  # With the adition of member the helper method ends up as detail_brand_product[_path|_url]
  # and creates route /brands/1/products/1/detail (GET, but can be any HTTP method)
  resources :brands do
    resources :products do
      member do
        get :detail
      end
      # For several http methods and avoding the block:
      # match :detail, via: [:get, :post], on: :member

      # Will create route detail_brand_products method which creates the route
      # /brands/:brand_id/products/detail which maps to the same 'detail' method of the
      # products controller, that is useful in case I want to do an action for all the
      # products, for instance, see the detail of all or updating en masse
      collection do
        match :detail, via: [:get, :post]
      end
      # also can be
      # match :terminate, via: [:get, :post], on: :collection
    end
  end

  # - The 'shallow' parameter only generates nested routes for 'index', 'create' and 'new' actions
  # resources :brands do, shallow: true
    # resources :products
  # end

  # Creates all restful routes and enables <name>_path, <name>_url helpers
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Changes the default name of the 'new' and 'edit' actions, so they can be used as
  # /products/nuevo and /products/cambiar
  # resources :products, path_names: { new: 'nuevo', edit: 'cambiar' }

  # Mapping to a different controller
  # resources :products, controller: "productos"

  # Enables methods for new resources, this example creates:
  # preview_new_product GET    /products/new/preview(.:format) products#preview
  # resources :products do
  #   new do
  #     get :preview
  #   end
  # end

  # Simple examples
  get 'route-test' => 'routes_test#index'
  get 'route-test/:id' => 'routes_test#show'

  # To test the 'format' param (or when the 'Accept' header is sent)
  get 'route-test-format-responder' => 'routes_test#format_responder'

  # Has a template used to show route generations using link_to
  get 'route-test-links' => 'routes_test#links'

  # - Hard coding a parameter (using a separate route like route-test/hardcoded/hello instead is recomended)
  # get 'route-test-hardcoded-param' => 'routes_test#hard_coded_param', hardcoded: 'Hello'
  # - Can also be set as a default
  get 'route-test-hardcoded-param' => 'routes_test#hard_coded_param', defaults: { hardcoded: 'Hello' }

  # Specifying several methods
  match 'route-test-methods' => 'routes_test#index', via: [:get, :post]

  # Redirecting (also showing the I can put a '/' at the beginning and it will work the same)
  get '/route-test-links-page', to: redirect('route-test-links')
  # Redirecting and passing the parameter
  get 'route-test-show/:id', to: redirect('route-test/%{id}')
  # Passing a status (and a block. Do not pass a do/end block, use brackets only)
  get 'route-test-show-old/:id', to: redirect(status: 302) {|params| "route-test/#{params[:id]}"}
  # - Passing a path parameter
  # get 'route-test-show-old/:id', to: redirect(status: 302, path: 'route-test/%{id}')
  # - An onject that responds to 'call' can be passed as well, if the returned 
  # - route doesn't have a leading slash, it is prefixed with the content of the SCRIPT_NAME
  # - env variable, which is typically a forward slash.
  # get 'route-test-show-old/:id', to: redirect(MyRedirector.new('route-test'))

  # Using a proc intead of a controller method
  get 'route-test-proc', to: proc { |env| [200, {}, ['Hello']] }

  # Using constraints
  get 'route-test-constrainted/:id' => 'routes_test#show', constraints: { id: /\d+/ } 
  # get 'route-test-constrainted/:id' => 'routes_test#show', constraints: { subdomain: 'admin' }
  # Using a proc for the constraints
  #get 'route-test-constrainted/:id' => 'routes_test#show',
  # constraints: proc { |req| req.params[:id].to_i < 100 }
 
  # Setting the root page
  root to: 'routes_test#index'

  # Route globbing
  get 'route-test-globbing/*items' => 'routes_test#globbing'

  # Named routes (to be able to create '<name>_url and <name>_path')
  # can be tested in the console as 'app.rtn_path(id: 1)' or 'app.rtn_url(id: 1)'
  get 'route-test-named/:id' => 'routes_test#show', as: 'rtn'
  # Pass an active record object and it will take the id by default
  get 'route-test/dummy/:id' => 'routes_test#show_dummy', as: 'dummy'
  # For generating the route of an asociation, it generates '/route-test/dummy/1/test/1'
  get 'route-test/dummy/:dummy_id/test/:id' => 'routes_test#show_dummy_test', as: 'test'

  # Scoping urls (grouping by controller), can also be defined as: 'controller :routes_test do'
  # - or like 'scope :auctions do', because it takes the first symbol as the controllers name (if there's only one)
  #scope controller: :routes_test do
    #get 'route-test-scoped/scoped-index' => :index
    #get 'route-test-scoped/scoped-show/:id' => :show
  #end
  # - Reducing the url string with 'path'
  scope path: 'route-test-scoped', controller: :routes_test do
    get 'route-test-scoped-index' => :index
    get 'route-test-scoped-show/:id' => :show
  end
  # Using the 'as' param to create scoped named routes. Creates routing_all_path/url helper
  scope controller: :routes_test, as: 'routing' do
    get 'route-test/named-index' => :index, as: 'all'
  end

  # Namespaces (grouping by URL)
  namespace :routes_test do
    get 'namespaced' => :index # creates the route /routes_test/namespaced
  end

  # Scoped constraints
  scope controller: :routes_test, constraints: {:id => /\d+/} do
    get 'route-test/scoped-constrainted/:id' => :show
  end
  #scope path:'route-test', controller: :routes_test do
    #get 'scoped-constrainted/:id' => :show
    #constraints :id => /\d+/ do
      #get 'scoped-constrainted-index' => :index
    #end
  #end

  # Using an object/class for reusing constraints
  constraints(R5kitchensink::IdConstraint) do
    get 'scoped-constrainted-with-class/:id' => 'routes_test#show'
  end

  # Direct routes
  direct(:directed_route) { 'http://www.google.com' }

  # Try routes /rep_of_resources/respond-to-method.html and /rep_of_resources/respond-to-method.xml
  namespace :rep_of_resources do
    get 'respond-to-method' => :respond_to_method
  end
  # Can also be
  #scope controller: :rep_of_resources do
    #get 'rep_of_resource/respond-to-method' => :respond_to_method
  #end

  get 'controller-test/render' => 'routes_test#render_test'
  get 'controller-test/redirect' => 'routes_test#redirect_test'
  get 'controller-test/helpers' => 'routes_test#helpers_test'

  # List all routes with: 'rails routes'
  # List show routes of a specific controller with: 'rails routes -c routes_test'
end
