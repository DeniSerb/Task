Rails.application.routes.draw do
  
	get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  get  'static_pages/about'

  get 'static_pages/contact'

  root 'application#hello'
end
