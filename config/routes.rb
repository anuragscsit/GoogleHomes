Rails.application.routes.draw do
  

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'requirements/new'
  get 'requirements/create'
  get 'tenant/tenant_profile/edit'
  get 'house_owner_profile/edit'
  get 'owner/house_owners/dashboard'
  get 'tenant/tenants/dashboard'
  get 'tenant/tenants/profile'
  get 'home/index'
  get 'home/owner'
  get 'home/tenant'
  get 'home/ghomeshouses'
  get 'home/error'
  get 'payments/bed_confirmation'
  post 'payments/confirmation'
  get 'payments/booking'
  devise_for :tenants, skip: [:sessions]
  devise_for :house_owners, skip: [:sessions]
  devise_for :users, skip: :registrations
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'
  resources :search, only: [:new, :index]
  resources :requirements , only: [:create]
  resources :houses, except: [:index,:destroy]
  resources :visit_schedules, only: [:new,:create,:edit, :show]
  resources :payments
  resources :room_rents, only:[:new,:create, :show]
  resources :reviews, only: [:create]
  resources :deposites, only: [:create,:show]
############################################################################### 
  namespace :tenant do 
    resources :tenants do
      collection do 
        get :payments
        get :dashboard
        get :myhouse
      end
      resources :tenant_profile, path: :profile
        
    end
  end
  resources :charges 
  get 'charges/booking'
###############################################################################
  namespace :owner do
    resources :house_owners do
     collection do 
        get :my_houses
        get :dashboard
        get :my_payments
        get :my_credits
        get :my_notifications
      end
    resources :house_owner_profile
    resources :visit_schedules, only: [:index,:show]
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
