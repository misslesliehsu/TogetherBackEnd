Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
      namespace :v1 do
        resources :users
        resources :ideas do
          resources :date_suggestions, only: [:index, :create, :destroy] do
            resources :votes, only: [:index, :create, :destroy]
          end
          resources :idea_comments, only: [:index, :create, :destroy]
        end
        resources :friendships, only: [:index, :create, :destroy]
        resources :invitations, only: [:index, :create, :destroy]
      end
    end
  end
