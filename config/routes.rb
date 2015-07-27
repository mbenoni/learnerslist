Rails.application.routes.draw do
  devise_for :users
  root                'static_pages#home'
  get  'about'      => 'static_pages#about'
  get  'tags/:tag'  => 'resources#index', as: :tag
  resources :resources, only: [:index, :create, :update, :destroy]
end
