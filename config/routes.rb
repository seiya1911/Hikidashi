Rails.application.routes.draw do
  get 'homes/top'
  devise_for :users, controllers:
  { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions',registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'

  resources :users, only: [:show, :edit, :update]
  resources :drawers, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: %i[create destroy]
    resources :items, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  resources :tags, only: [:new, :destroy]

  get 'searches/items'
  get 'searches/drawers'
end
