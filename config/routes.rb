Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :permits do
        resources :environments
        resources :precautions
        resources :protections
      end
      resources :users
    end
  end
end
