Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
    root :to => redirect('/movies')

	resources :movies do
	  get 'search', :on => :member
	  get 'similar',:on => :member
	end

end
