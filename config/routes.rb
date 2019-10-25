Rottenpotatoes::Application.routes.draw do
    # map '/' to be a redirect to '/movies'
   resources :movies
   root :to => redirect('/movies')
   get '/movies/:id/same_director' => 'movies#samedirector_movies', as: :same_director
  
end
