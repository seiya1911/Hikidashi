Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about'
  get 'about' => 'homes#about'
  devise_for :users, controllers:
  { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions',registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'

  resources :users, only: [:show, :edit, :update]
  resources :drawers, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: %i[create destroy]
    resources :items, only: [:show, :new, :create, :edit, :update, :destroy] do
      put :sort
    end
  end

  resources :tags, only: [:index, :destroy]

  #検索用
  get 'searches/search'
  get 'search' => 'searches#search'
  get 'searches/items'
  get 'searches/tag_items'
  get 'searches/drawers'
end
