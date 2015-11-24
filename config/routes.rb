Rails.application.routes.draw do
  resources :topics do
    resources :bookmarks
  end

  devise_for :users
  
  # Blocmarks - Intro
  root 'welcome#index'
  get 'welcome/about'

  # Blocmarks, 4. Receive Incoming Emails
  post :incoming, to: 'incoming#create'
end
