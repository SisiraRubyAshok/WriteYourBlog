Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :blogs do
    collection do
      get 'my_blogs'
    end
  end
  root "welcome#index"
end
