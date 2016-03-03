Rails.application.routes.draw do
  devise_for :users
  root "categories#index"
  resources :categories
  resources :projects do
    post :like, on: :member
    get :favorite, on: :collection
  end

end
