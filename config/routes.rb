Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :plans, only: %i(index) do
    member do
      get :calculate_bill
    end
  end
end
