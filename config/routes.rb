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


    resources :tasks do
      patch 'add_response', action: :add_response, controller: 'tasks'
    end
    #custom route for task_controller.responses
    resources :tags, only: [:show]
    resources :categories, only: [:show]
    resources :infos, only: [:show]
    resources :performers
    resources :comments

    namespace :myprofile do
      resources :infos, except: [:destroy]
      resources 'customer_tasks', :tasks, :controller=>'customer_tasks', as: 'tasks' do
        put 'accept_response', action: :accept_response, controller: 'customer_tasks'
        put 'decline_response', action: :decline_response, controller: 'customer_tasks'
        put 'add_review', action: :add_review, controller: 'customer_tasks'

      end

      resources :jobs do
        post 'task_done', action: :task_done, controller: 'jobs'
        post 'cancel_response', action: :cancel_response, controller: 'jobs'
        post 'cancel_job', action: :cancel_job, controller: 'jobs'


      end
    end




    namespace :moderate do
      resources :tasks, only: [:moderate, :show, :index, :update] #confirm, decline, changes
      resources :performers, only: [:show, :moderate] #verify, decline
      resources :users, only: [:show, :update, :index, :update] #ban
    end

    namespace :admin do
      resources :categories, except: [:show]
      resources :pictures, only: [:create, :destroy]
      resources :tasks
      resources :moderators




    end
  end
 end
