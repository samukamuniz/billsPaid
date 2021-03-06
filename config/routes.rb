Rails.application.routes.draw do

  root 'site/home#index'

  #et '/site/expense_types', to: 'site/expense_types#index', as: 'TiposDespesa'

  namespace :site do
    get 'home', to: 'home#index'
    resources :accounts, except: [:show]
    resources :categories, except: [:show]
    resources :expenses, except: [:show]
    resources :expense_types, except: [:show]
    resources :incomes, except: [:show]
    resources :income_types, except: [:show]
    resources :transactions, except: [:show]
    resources :members,  except: [:show, :destroy]
  end

  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    get 'dashboard', to: 'dashboard#index'
    resources :admins, except: [:show]
  end

  devise_for :admins, :skip => [:registrations]
  devise_for :members

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
