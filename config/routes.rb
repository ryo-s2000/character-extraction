Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'photos#index'
  post '/extraction', to: 'photos#extraction'
  get '*path', to: 'photos#index'
end
