Rails.application.routes.draw do
  resources :recipes
  resources :ingredients, param: :ingredient
  root 'recipes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
