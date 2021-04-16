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
    get '/mypage' => 'users#show'
    get '/mypage/edit' => 'users#edit'
    patch '/mypage/edit' => 'users#update'
    get '/user/status' => 'users#status'
    patch '/user/change' => 'users#change'
    resources :books, only: [:index, :new, :create, :show] do
      resources :reviews, only: [:create, :destroy]
      resource :good_books, only: [:create, :destroy]
      resource :favorite_books, only: [:create, :destroy]
    end
  end
  
  namespace :admin do
    get 'homes/top'
    resources :users, only: [:index, :show, :edit, :update]
    
    resources :books, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    
    resources :classifications, only: [:index, :create, :update, :destroy]
    resources :genres, only: [:index, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
