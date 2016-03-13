Rails.application.routes.draw do
  resources :recruitments do
    resources :interviews
  end
  resources :candidates
end
