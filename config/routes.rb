Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :delars
    resources :mobiles

    root to: "users#index"
  end

  get 'mobile/:mobile_id/:mobile_name' => 'home#mobile_show', :as => :view_mobile
  devise_for :users
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
