Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :players

  unauthenticated do
    root to: 'pages#home'
  end

  authenticated do
    root to: 'pages#dashboard', as: 'dashboard'
  end
end
