Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :dashboard, only: [:index]
  resource :game, only: [] do
    member do
      post :roll, to: 'game#roll'
      post :cash_out, to: 'game#cash_out'
    end
  end

  root to: 'users#new'
end
