Rails.application.routes.draw do
  get 'searches/search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/search', to: "searches#search"
  root :to => "homes#top"
  get "home/about" => "homes#about"
  devise_for :users
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy, :index]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :relationships


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end