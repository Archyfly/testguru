Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  # get 'sessions/new'
  # get 'users/new'
  # resources :answers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Убрали после подключения devise
  # get :signup, to: 'users#new'
  # get :login, to: 'sessions#new'

  # resources :users, only: :create
  # resources :sessions, only: :create
  # resources :sessions, only: :destroy

  delete :logout, to: 'sessions#destroy'


  resources :tests, only: :index do
    resources :questions, only: :index, shallow: true do
      resources :answers, only: :index, shallow: true
    end

  #  resources :tests, only: :index do
  #    resources :questions, except: :index, shallow: true do
  #      resources :answers, except: :index, shallow: true
  #    end

    member do
      post :start
    end

  end

  # GET test_passages/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  # Здесь мы говорим что все остальные ресурсы tests будут
  # находится в пространстве имен admin
  namespace :admin do
    resources :tests do
      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
  end

#  get 'about/author'
#  resources :tests
#  get '/tests', to: 'tests#index'
#  resources :questions
#  get '/questions', to: 'questions#index'
# проверка get '/answers', to: 'answers#index'
#  get 'tests/:id/start', to: 'tests#start'

end
