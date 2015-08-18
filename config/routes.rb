Rails.application.routes.draw do
  root                 'static_pages#home'
  get  'about'      => 'static_pages#about'
  get  'tags/:tag'  => 'static_pages#home', as: :tag
  resources :resources, only: [:create, :update, :destroy]
  devise_for :users, :skip => [:sessions, :registrations, :passwords]
  as :user do
    get    'login'    => 'devise/sessions#new',         :as => :new_user_session
    post   'login'    => 'devise/sessions#create',      :as => :user_session
    delete 'logout'   => 'devise/sessions#destroy',     :as => :destroy_user_session

    get    'signup'   => 'devise/registrations#new',    :as => :new_user_registration
    post   'signup'   => 'devise/registrations#create', :as => :user_registration
    get    'settings' => 'devise/registrations#edit',   :as => :edit_user_registration
    patch  'settings' => 'devise/registrations#update'
    put    'settings' => 'devise/registrations#update'

    get    'password_reset/new'  => 'devise/passwords#new',    :as => :new_user_password
    get    'password_reset/edit' => 'devise/passwords#edit',   :as => :edit_user_password
    post   'password_reset'      => 'devise/passwords#create', :as => :user_password
    patch  'password_reset'      => 'devise/passwords#update'
    put    'password_reset'      => 'devise/passwords#update'
  end
end
