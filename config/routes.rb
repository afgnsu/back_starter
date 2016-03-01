Rails.application.routes.draw do
  root "categories#index"
  resources :categories
  resources :projects
end
