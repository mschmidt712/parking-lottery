Rails.application.routes.draw do
  resources :employees

  resources :home do
    collection do
      get :select_winner
      get :delete_employee
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
