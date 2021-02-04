Rails.application.routes.draw do
   root 'homes#top'
   devise_for :users
   get 'home/about' => 'homes#about'
   get 'users/:id/show_follow' => 'users#show_follow', as: "users_show_follow"
   get 'users/:id/show_follower' => 'users#show_follower', as: "users_show_follower"
   resources :users,only: [:show,:index,:edit,:update]

   resources :relationships, only: [:create, :destroy]



   resources :books do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
   end
end