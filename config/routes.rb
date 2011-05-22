AppQueueing::Application.routes.draw do
  resources :business_cards
  root :to => 'business_cards#index'
end
