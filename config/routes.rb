Rails.application.routes.draw do

   root 'users#index'
   resources :users do
     resources :dogs
   end

  resources :dogs


end
