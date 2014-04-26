WebsiteFrancisFerrari::Application.routes.draw do
  devise_for :users
  resources :aligns

  mount Ckeditor::Engine => '/ckeditor'
  scope do
    match "contents/:id" => "contents#show", :via => "GET"
    match "contents/:uuid/backgrounds" => "backgrounds#index", :via => "GET"
    match "annoncments/:title_annoncment_id/backgrounds" => "backgrounds#index", :via => "GET"
  end

  resources :header_backgrounds
  resources :sub_menu_backgrounds
  resources :background_by_defaults
  resources :menu_backgrounds
  resources :categories, :as => "title" do
    resources :submenu, :as => "title_submenu" do
      resources :contents, :as => "uuid" do
        resources :backgrounds
      end
      resources :annoncments, :as => "title_annoncment" do
        resources :backgrounds
        resources :photos
      end
    end
    resources :contents
    resources :annoncments do
      resources :photos
    end
  end

  root :to => "home#index"

  namespace :admin do
    resources :sub_menu_backgrounds do
      post :activation, :on => :collection
    end
    resources :menu_backgrounds do
      post :activation, :on => :collection
      get :get_activation, :on => :collection
    end
    resources :footer_backgrounds do
      post :activation, :on => :collection
    end
    resources :header_backgrounds do
      post :activation, :on => :collection
    end
    resources :background_by_defaults do
      post :activation, :on => :collection
    end
    scope do 
      match "categories/annoncments/sort" => "annoncments#sort", :via => "GET"
    end
    resources :categories, :as => "title" do
      scope do
        match "submenus/:title_submenu_id/update_success" => "submenus#update_success", :via => "GET"
      end
      resources :submenus, :as => "title_submenu" do
        get :sort, :on => :collection
        post :content_or_annoncment_homepage, :on => :collection
        get :update_success, :on => :member
        resources :contents do
          get :sort, :on => :collection
        end
        resources :annoncments do
          get :sort, :on => :collection
          resources :photos do
            get :add_form_photo, :on => :collection
          end
        end
      end 
      resources :contents do
        get :sort, :on => :collection
      end
      get :sort, :on => :collection
      post :homepage, :on => :collection
      scope do
        match "photos/add_form_photo" => "photos#add_form_photo", :via => "GET"
      end
      resources :annoncments do
        get :sort, :on => :collection
        resources :photos do
          get :add_form_photo, :on => :collection
        end
      end
    end
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
