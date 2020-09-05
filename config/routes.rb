Rails.application.routes.draw do
  root "home#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'list_item#index'
  resources :lists, only: [:show, :index] do
    resources :list_items, only: [:index, :create]
  end

  resources :items, only: [:show, :index], controller: "item"

  resources :recipes, only: [:show, :index], controller: "recipe" do
    resources :methods, only: [:show], controller: "method"
  end
end
