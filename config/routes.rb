Rottenpotatoes::Application.routes.draw do
  get "help/help"
  get "help/about"

  resources :movies
  # map '/' to be a redirect to '/movies'
    root :to => redirect('/movies')

	resources :movies do
	  get 'search', :on => :member
	  get 'similar',:on => :member
	end

  

end
