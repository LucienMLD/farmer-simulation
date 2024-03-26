Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"

  controller :dashboards do
    get :index, as: :dashboard, path: :dashboard
  end
  resources :farms
end

