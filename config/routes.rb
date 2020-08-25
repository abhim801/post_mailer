Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts
  post 'mail_posts', :to => 'posts#mail_posts', as: :mail_posts
  get 'search_posts', :to => 'posts#search_posts', as: :search_posts
  
  get '/:id' => "shortener/shortened_urls#show"
end
