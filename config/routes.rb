Rails.application.routes.draw do
  root 'spells#index'

  match 'ajax/spells/spell_index', via: :get, to: 'spells#ajax_index'
  match 'ajax/spells/caster_edit/:id', via: :get, to: 'spells#ajax_caster_edit'
  match 'ajax/classes/class_index', via: :get, to: 'caster_classes#ajax_index'

  match 'spells', via: :get, to: 'spells#index'
  match 'spells/:id/edit', via: :get, to: 'spells#edit', as: :edit_spell
  match 'spells/:id', via: :get, to: 'spells#show', as: :spell
  match 'spells/:id', via: [ :put, :patch ], to: 'spells#update'

  match 'classes', via: :get, to: 'caster_classes#index', as: :caster_classes
  match 'classes', via: :post, to: 'caster_classes#create'
  match 'classes/new', via: :get, to: 'caster_classes#new', as: :new_caster_class
  match 'classes/:id', via: :get, to: 'caster_classes#edit', as: :edit_caster_class
  match 'classes/:id', via: [ :put, :patch ], to: 'caster_classes#update'

  match 'combat', via: :get, to: 'combatants#initiative', as: :combat

  match 'combatants', via: :get, to: 'combatants#index'
  match 'combatants', via: :post, to: 'combatants#create'
  match 'combatants/last_update', via: :get
  match 'combatants/clear', via: :get, as: 'clear_combatants'
  match 'combatants/:id', via: [ :put, :patch ], to: 'combatants#update'

  match 'dice', via: :get, to: 'dice#index', as: :dice

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
