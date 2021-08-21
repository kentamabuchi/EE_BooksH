Rails.application.routes.draw do
  
  namespace :admin do
    get 'genres/index'
  end
  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
    registrations: 'admin/registrations'
  }
  
  devise_for :users, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }
  
  root to: 'public/homes#top'
  
  scope module: 'public' do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    get '/mypage' => 'users#mypage'
    get '/mypage/edit' => 'users#edit'
    patch '/mypage/edit' => 'users#update'
    get '/user/status' => 'users#status'
    patch '/user/change' => 'users#change'
    get '/user/:id/favorite_books/' => 'users#favorites', as: 'user_favorite_books'
    get '/users/:id/relationships/' => 'users#relationships', as: 'user_relationships'
    get '/favorites/user/:id/' => 'users#favorite_books', as: 'user_favorite_books_index'
    get '/user/:id/followers/' => 'users#followers', as: 'user_followers_index'
    resources :users, only: [:show] do
      resource :relationships, only: [:create, :destroy]
    end
    get '/books/search/' => 'books#search'
    get '/books/test/' => 'books#test'
    patch '/reviews/:id/violation/' => 'books#change', as: 'reviews_violation'
    resources :books, only: [:index, :new, :create, :show, :update] do
      resources :reviews, only: [:create, :destroy]
      resource :good_books, only: [:create, :destroy]
      resource :favorite_books, only: [:create, :destroy]
    end
    resources :reviews, only: [:index, :show] do
      resources :return_comments, only: [:create, :destroy]
    end
    get '/book/classifications/:id' => 'books#book_classifications', as: 'book_classifications'
   
  end
  
  get 'admin/violation/books/' => 'admin/homes#violation_books', as: 'admin_violation_books'
  get 'admin/violation/reviews' => 'admin/homes#violation_reviews', as: 'admin_violation_reviews'
  
  namespace :admin do
    get 'top' => 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :books, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    
    resources :classifications, only: [:index, :create, :update, :destroy]
    resources :genres, only: [:index, :create, :update, :destroy]
    resources :reviews, only: [:show, :edit, :update, :destroy]
    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
