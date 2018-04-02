Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
      namespace :v1 do
        delete '/friendships/:user_id/:friend_id', to: 'friendships#destroy'
        resources :users do
          resources :friendships, only: [:index, :create]
          resources :ideas do
            resources :date_suggestions, only: [:index, :create, :destroy]
            resources :idea_comments, only: [:index, :create, :destroy]
          end
        end
        resources :invitations, only: [:create]
        delete 'votes/:date_suggestion_id/:user_id', to: 'votes#destroy'
        post 'votes/:date_suggestion_id/:user_id', to: 'votes#create'
        delete 'invitations/:idea_id/:invitee_id', to: 'invitations#destroy'
        put 'invitations/:idea_id/:invitee_id', to: 'invitations#update'
        get 'invitations/:idea_id/:invitee_id', to: 'invitations#show'
        get 'invitations/:user_id', to: 'invitations#index'
      end
    end

    post '/login', to: 'auth#login'
    get '/current_user', to: 'auth#currentUser'
    post '/signup', to: 'auth#signup'

  end
