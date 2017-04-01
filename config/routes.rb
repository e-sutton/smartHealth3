Rails.application.routes.draw do
  resources :prescriptions
  resources :profiles
  devise_for :users
  root:to => 'home#index'
  get 'home/index'
  get 'signedinuserprofile' => 'profiles#signedinuserprofile'

  devise_for :installs
  get 'requests/index'

  get 'requests/show'

  get 'requests/new'

  get 'requests/edit'

  resources :patients do
  resources :requests
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
