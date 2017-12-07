 Rails.application.routes.draw do


  get 'images/index'

  get 'images/create'

  get 'images/index'

  get 'images/create'

  get 'pictures/index'

  get 'pictures/create'

  get 'activities/index'

  resources :activities
  mount ActionCable.server => '/cable'



  # get 'auth/:provider/callback', to: 'sessions#create'

 # get 'auth/failure', to: redirect('/')
 # get 'signout', to: 'sessions#destroy', as: 'signout'

#  get 'sessions/create'

 # get 'sessions/destroy'



  get 'home/show'
  match '/anketa', to: 'infos#new', via:'get'



  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users




    root 'tasks#index'

    namespace :blog do
      resources :posts
      resources :pictures, only: [:create, :destroy]
      resources :post_tags, only: [:show]

    end

    resources :tasks do
      patch 'add_response', action: :add_response, controller: 'tasks'
      patch 'add_review', action: :add_review, controller: 'tasks'
    end
    get ':category_translit/tasks', to: 'tasks#index', as: :tasks_by_category
    #custom route for task_controller.responses


    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'signout', to: 'sessions#destroy', as: 'signout'

    resources :sessions, only: [:create, :destroy]
    resources :activities
    resources :tags, only: [:show]
    resources :categories
    resources :infos, only: [:show]
    resources :performers
    resources :comments
    resources :disputes do
    resource :dispute_users
    resources :messages
      end
    namespace :myprofile do
      resources :infos, except: [:destroy]
      resources 'customer_tasks', :tasks, :controller=>'customer_tasks', as: 'tasks' do
        put 'accept_response', action: :accept_response, controller: 'customer_tasks'
        put 'decline_response', action: :decline_response, controller: 'customer_tasks' , method: :delete



      end

      resources :jobs do
        post 'task_done', action: :task_done, controller: 'jobs'
        post 'cancel_response', action: :cancel_response, controller: 'jobs'
        post 'cancel_job', action: :cancel_job, controller: 'jobs'
        resources :disputes
        resource :dispute_users



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

