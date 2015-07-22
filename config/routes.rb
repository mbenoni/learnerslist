Rails.application.routes.draw do
  get 'resources/index'

  root           'static_pages#home'
  get 'about' => 'static_pages#about'
end
