Rails.application.routes.draw do
  
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'genre/index'
  end
  namespace :admin do
    get 'classifications/index'
  end
  namespace :admin do
    get 'books/index'
    get 'books/new'
    get 'books/show'
    get 'books/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'books/index'
    get 'books/show'
    get 'books/edit'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/status'
  end
  devise_for :admins
  devise_for :users
  root to: 'public/homes#top'
  
  scope module: 'public' do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
