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
      get :message
      post :send_message
    end
  end

  resources :gists, only: :create

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: :true do
        resources :answers, shallow: :true
      end
    end
    resources :gists, only: :index
  end

  # post 'send_message' => 'test_passages#send_message'

end
