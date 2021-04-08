Rails.application.routes.draw do
  
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
    get '/users/status' => 'users#status'
    patch '/users/change' => 'users#change'
    resources :books, only: [:index, :new, :create, :show, :edit, :update ]
  end
  
   namespace :admin do
    get 'homes/top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :books, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :classifications, only: [:index, :create, :update, :destroy]
    resources :genres, only: [:index, :create, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
