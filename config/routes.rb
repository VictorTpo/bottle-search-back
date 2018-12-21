Rails.application.routes.draw do
  resources :bottles, only: %w(show create) do
    collection do
      post :search
    end
  end
end
