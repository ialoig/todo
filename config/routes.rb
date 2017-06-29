Rails.application.routes.draw do
  devise_for :users
  resources :todo_lists do 
    resources :todo_items do
  		member do 
  			patch :complete
  			patch :uncomplete
  		end
  	end
  end
  
  devise_scope :user do
    get "/sign-in" => "devise/sessions#new", :as => :login
  end

  root "todo_lists#index"


end
