Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  delete :logout, to: 'sessions#destroy'

  resources :tests, only: :index do
    resources :questions, only: :index, shallow: true do
      resources :answers, only: :index, shallow: true
    end

    member do
      post :start
    end

  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions do
        resources :answers
      end
    end
  end

  resources :gists, only: %i[index show]

end
