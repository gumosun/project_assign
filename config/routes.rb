Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"
  resources :users
  resources :projects do
  collection do 
    get :search, :action => 'search_projects', :as => 'search_project'
    get 'search/:q', :action => 'search', :as => 'search'
  end
end
end
