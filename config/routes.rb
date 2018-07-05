Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :resources, only: [:show, :create, :update, :destroy]

 get 'lesson/:slug/resources', to: 'resources#index', as: 'lesson_resources'
end
