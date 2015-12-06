Rails.application.routes.draw do
  get 'users/show'

  resources :topics do
    resources :bookmarks, except: [:index] do
      # Blocmarks, 8. Like and Unlike Bookmarks
      resources :likes, only: [:create, :destroy]
    end
  end

  devise_for :users
  
  # Blocmarks, 9. User Profiles
  resources :users, only: [:show]
  
  # Blocmarks - Intro
  root 'welcome#index'
  get 'welcome/about'

  # Blocmarks, 4. Receive Incoming Emails
  post :incoming, to: 'incoming#create'
end
