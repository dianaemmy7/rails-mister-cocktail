Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'contails#index'
  resources :cocktails, only: [:index, :show, :edit, :update, :new, :create] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
  resources :ingredients, only: [:index]
end
