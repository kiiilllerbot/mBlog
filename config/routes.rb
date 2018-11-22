Rails.application.routes.draw do
  devise_for :users
	root 'posts#index'
	resources :posts do
		resources :comments
	end
	get 'pages/about' => 'pages/about', as: :about
	get 'pages/contact' => 'pages/contact', as: :contact
end
