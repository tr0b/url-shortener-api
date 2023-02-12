Rails.application.routes.draw do
  resources :urls
  root :to => "home#index"
end
