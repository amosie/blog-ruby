Blog::Application.routes.draw do
  root 'welcome#index'
  # resources gives you all seven restful routes
  resources :posts
end
