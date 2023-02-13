Rails.application.routes.draw do
  resources :urls
  root :to => "home#index"
  '/:short_code' :to => "urls#redirect"
end
