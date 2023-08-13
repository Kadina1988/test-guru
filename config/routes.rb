Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :gists, only: :create

  resources :badges, only: :index
  get 'users/:id/badges' => 'users#list_badges'

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: :true do
        resources :answers, shallow: :true
      end
    end
    resources :gists, only: :index
    resources :badges
  end

  resources :messages, only: %i[new create]
end
