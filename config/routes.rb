Rails.application.routes.draw do

 # get 'auth/:provider/callback', to: 'sessions#create'
 # get 'auth/failure', to: redirect('/')
 # get 'signout', to: 'sessions#destroy', as: 'signout'

#  get 'sessions/create'

 # get 'sessions/destroy'

  #get 'home/show'
  match '/anketa', to: 'infos#new', via:'get'



  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users


    root 'tasks#index'


    resources :tasks
    resources :tags, only: [:show]
    resources :categories, only: [:show]
    resources :infos
    resources :performers
    resources :comments


    namespace :moderate do
      resources :tasks, only: [:moderate, :show, :index, :update] #confirm, decline, changes
      resources :performers, only: [:show, :moderate] #verify, decline
      resources :users, only: [:show, :update, :index, :update] #ban
    end

    namespace :admin do
      #Убрать админа, не забудь вынести пути и переделать контроллер
      resources :categories, except: [:show]
      resources :pictures, only: [:create, :destroy]
      resources :tasks
      resources :moderators




    end
  end
 end
