Rails.application.routes.draw do
  resources :urls
  root :to => "home#index"
  get "/:short_code" => "urls#redirect"
end
