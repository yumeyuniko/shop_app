Rails.application.routes.draw do
  devise_for :users
  root "shops#index"
end
