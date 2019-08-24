Rails.application.routes.draw do
  resources :answers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
    end

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

#  get 'about/author'
#  resources :tests
#  get '/tests', to: 'tests#index'
#  resources :questions
#  get '/questions', to: 'questions#index'
# проверка get '/answers', to: 'answers#index'
#  get 'tests/:id/start', to: 'tests#start'

end
