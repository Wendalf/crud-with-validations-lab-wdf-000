Rails.application.routes.draw do
  resources :songs, only: [:new, :edit, :show, :update, :destroy]
  get '/', to: 'songs#index', as: 'songs'
  post '/', to: 'songs#create'
end
