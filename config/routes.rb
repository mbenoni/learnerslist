Rails.application.routes.draw do
  root                'static_pages#home'
  get  'about'     => 'static_pages#about'
  get  'resources' => 'resources#index'
  post 'resources' => 'resources#create'
end
