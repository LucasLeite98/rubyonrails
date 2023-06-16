Rails.application.routes.draw do
  # devise_for :users
  namespace 'api', defaults: {format: :json} do
    resources :posts, except: [:new, :edit]
    resources :contacts
    resources :sessions, only: [:create, :destroy]
  end
end
