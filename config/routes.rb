Rails.application.routes.draw do

  resources :shipping_rates


  resources :standardformats

  resources :merchant_infos

  devise_for :customers, :controllers => {:omniauth_callbacks => "omniauth_callbacks", :sessions => "customers/sessions", :registrations => "customers/registrations"}
  resources :customers

  resources :invoices
  get '/pay_fast/:id', to: 'invoices#pay_fast', as: 'pay_fast'
  match "/payfast/:random_id" => "invoices#pay_fast", via: [:get, :post]

  resources :shipping_infos

  resources :line_items

  resources :carts
  get 'add_to_cart' => 'carts#_cart'

  devise_for :admins, :controllers => {:sessions => "admins/sessions", :registrations => "admins/registrations"}

  resources :categories

  resources :brands

  resources :products
  #post 'my_product' => 'products#my_product'
  get 'my_product' => 'products#my_product', :as => :my_product
  get 'buy_from_post/:id' => 'products#buy_from_post', :as => :buy_from_post

  devise_for :merchants, :controllers => {:omniauth_callbacks => "omniauth_callbacks", :sessions => "merchants/sessions", :registrations => "merchants/registrations"}

  resources :merchants
  get '/sign_out' => 'merchants/sessions#destroy'
  put 'confirm_merchant/:id' => 'merchants#confirm_merchant', :as => :confirm_merchant
  put 'unconfirm_merchant/:id' => 'merchants#unconfirm_merchant', :as => :unconfirm_merchant
  get "/unapproved_merchants" => "merchants#unapproved_merchants"

  resources :orders
  get 'my_checkout' => 'orders#my_checkout'
  post 'sent_to_2c2p' => 'orders#sent_to_2c2p', :as => :sent_to_2c2p
  post 'sent_to_order' => 'orders#sent_to_order', :as => :sent_to_order


  resources :homes
  root 'homes#index'
  get 'my_test' => 'homes#my_test'
  get 'test' => 'homes#test'
  get 'not_approve' => 'homes#not_approve'

  resources :stores
  get 'open_new_store' => 'stores#open_new_store'
  

  resources :admins
  get 'dashboards' => 'admins#dashboard'

  resources :sellers
  post 'mytest' => 'merchants#mytest'


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
