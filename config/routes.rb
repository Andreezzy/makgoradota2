Rails.application.routes.draw do
  devise_for :users, skip: [:registrations], controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }

  post '/custom_sign_up', to: "omniauth_callbacks#custom_sign_up"

  root 'main#home'
  #Por arreglar for nil:Nilclass
  get '/completar_registro', to: "main#edit"

  get '/inscribir', to: "main#inscripcion"
  get '/unirse', to: "main#unirse"
  post '/check_ticket', to: "main#check_ticket"
  post '/create_ticket', to: "main#crear_ticket"
  get '/bases', to: "main#bases"
  get '/generar', to: "main#generar"
  #get '/check_ticket', to: "main#inscripcion"
  
  resources :teams do
    resources :players
  end

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
