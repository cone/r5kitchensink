Rails.application.routes.draw do
  # Creates all restful routes and enables <name>_path, <name>_url helpers
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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

  # List all routes with: 'rails routes'
  # List show routes of a specific controller with: 'rails routes -c routes_test'
end
