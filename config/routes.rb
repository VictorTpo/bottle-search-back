Rails.application.routes.draw do
  resources :bottles, only: %w(index show create)
end
