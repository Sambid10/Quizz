Rails.application.routes.draw do 
resources :categories do
  member do
    get :edit_questions
    patch :update_questions
  end
end

namespace :public do
  resources :categories, only: [:index, :show] do
    member do
      get :answer
      post :submit_answers 
      get  :show_category_answers 
    end
  end
end
 devise_for :admin, controllers: {
  sessions: 'admin/sessions'
}, skip: [:registrations]
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  root "pages#home"
  get "pages/users"
  get "pages/admin"



resources :user_answers, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
