Rails.application.routes.draw do

  get 'tags/index'

  root to: 'landing_page#index'

  controller 'tags' do
    get '/tags' => :index
    post '/tags/search' => :search
    post '/tags/list_institutes' => :list_institutes
    post '/tags/list_themes' => :list_themes
  end

  controller 'groups' do
    get '/groups' => :index
    get '/groups/:id' => :index
    post '/groups/show' => :show
    post '/groups/new' => :new
    post '/groups/list' => :list
    post '/groups/create' => :create
    post '/groups/update' => :update
    post '/groups/associate_institute' => :associate_institute
    post '/groups/create_institute' => :create_institute
    post '/groups/institutes' => :institutes
    post '/groups/themes' => :themes

  end

  controller 'group_meeting' do
    get '/group_meeting/:id' => :index
    post '/group_meeting/send_message' => :send_message
    post '/group_meeting/get_messages' => :get_messages
  end

  controller 'meetings' do
    get 'meetings/:id' => :index
    post 'meetings/generate/' => :generate
    post 'meetings/list/' => :list
    post 'meetings/associate_theme' => :associate_theme
    post 'meetings/create_theme' => :create_theme
    post 'meetings/themes' => :themes
  end


  #facilita acesso a resourses
  # resources :tags
  #get 'landing_page/index'

  devise_for :users
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
