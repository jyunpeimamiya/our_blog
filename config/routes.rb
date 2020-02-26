Rails.application.routes.draw do
  devise_for :users, controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks',
  registrations: 'users/registrations'
}
  resources :users, only: [:index, :show]
  resources :posts do
    collection do
      get 'search'
    end
    resources :likes, only: [:create, :destroy]
  end

  root to: 'posts#index'

end