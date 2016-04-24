Rails.application.routes.draw do
  
  get 'requirements/new'
  get 'requirements/create'
  get 'tenant/tenant_profile/edit'
  get 'house_owner_profile/edit'
  get 'owner/house_owners/dashboard'
  get 'tenant/tenants/dashboard'
  get 'tenant/tenants/profile'
  get 'home/index'
  get 'home/owner'
  get 'home/map'
  get 'home/ghomeshouses'
  devise_for :tenants, skip: [:sessions]
  devise_for :house_owners, skip: [:sessions]
  devise_for :users, skip: :registrations
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'
    get 'profile', :to => "profile#edit"
  resources :search, only: [:new]
  resources :requirements , only: [:create]
  resources :houses, except: [:index,:destroy]
  resources :visit_schedules, only: [:new,:create,:edit, :show]
############################################################################### 
  namespace :tenant do 
    resources :tenants do
      collection do 
        get :payments
        get :dashboard
      end
      resources :tenant_profile
      
    end
  end
###############################################################################
  namespace :owner do
    resources :house_owners do
     collection do 
        get :my_houses
        get :dashboard
        get :my_payments
      end
    resources :house_owner_profile
    resources :visit_schedules, only: [:index,:show]
    #resources :houses,except:[:destroy]
  end
 ############################################################################ 
end 
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
