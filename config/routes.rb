Rails.application.routes.draw do
  namespace :api, constraints: { format: 'json'} do
    namespace :v1 do
      resources :reports, only: [:index, :show]
  end
end
end
