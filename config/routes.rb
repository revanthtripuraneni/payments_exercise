Rails.application.routes.draw do
  constraints format: :json do
    resources :loans, ony: [:index, :show] do
      resources :payments, only: [:index, :show, :create]
    end
  end
end
