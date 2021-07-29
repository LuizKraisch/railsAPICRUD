Rails.application.routes.draw do
  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      resources :organizations, only: [:index, :show, :create, :update, :destroy]
      scope "o/:organization_id" do
        resources :people, only: [:index, :show, :create, :update, :destroy] do
          member do
            get :graduations
          end
        end
        resources :opportunities, only: [:index, :show, :create, :update, :destroy]
        resources :categories, only: [:index, :show, :create, :update, :destroy]
        resources :graduations, only: [:index, :show, :create, :update, :destroy]
        resources :employees, only: [:index, :show, :create, :update, :destroy]
        resources :recruiters, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end
end
