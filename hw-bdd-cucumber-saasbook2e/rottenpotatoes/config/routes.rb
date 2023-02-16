Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  get '/auth/facebook/callback', to: 'omniauth_callbacks#facebook' #add path to facebook au in /move
  get 'notfound', to: 'movies#notfound', as: 'notfound_movies'
  root :to => redirect('/movies')
end
