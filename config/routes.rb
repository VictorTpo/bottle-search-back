Rails.application.routes.draw do
  devise_for :users,
              path: '',
              path_names: {
                sign_in: 'login',
                sign_out: 'logout'
              },
              controllers: {
                sessions: 'sessions'
              }

  resources :bottles, only: %w(show create) do
    collection do
      post :search
    end
  end

  resources :users, only: %w(create) do
    collection do
      get :me
    end
  end
end
