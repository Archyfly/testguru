Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'tests#index'

  resources :tests, shallow: true do
    resources :questions 
  end

#  get 'about/author'
#  resources :tests
#  get '/tests', to: 'tests#index'
#  resources :questions
#  get '/questions', to: 'questions#index'
# проверка get '/answers', to: 'answers#index'
#  get 'tests/:id/start', to: 'tests#start'

end
