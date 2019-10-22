Rottenpotatoes::Application.routes.draw do
  resources :movies do
    get 'same_director', on: :member
  end  
  # map '/' to be a redirect to '/movies'
  root :to => 'movies#index' #redirect('/movies') #
end
