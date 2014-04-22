Firstroutes::Application.routes.draw do
  resources :users, :only => [:index, :create, :show, :update, :destroy] do
    resources :contacts, :only => [:index]
  end
  resources :contacts, :only => [:create, :show, :update, :destroy]
  resources :contact_shares, :only => [:create, :destroy]
end


