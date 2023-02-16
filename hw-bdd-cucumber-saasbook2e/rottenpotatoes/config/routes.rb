Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  get '/auth/facebook/callback', to: 'sessions#create' #add path to facebook au in /move
  root :to => redirect('/movies')
end
