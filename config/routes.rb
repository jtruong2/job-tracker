Rails.application.routes.draw do
root to: "welcome#index"
  resources :categories

  resources :companies do
    resources :contact, only: [:create]
    resources :jobs do
      resources :comments, only: [:create]
    end
  end

 get '/jobs', to:'jobs#all_jobs'
end
