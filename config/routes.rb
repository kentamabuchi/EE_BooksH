Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :users
  root to: 'public/homes#top'
  
  scope module: 'public' do
    get '/' => 'public/homes#top'
    get 'about' => 'public/homes#about'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
