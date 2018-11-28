Rails.application.routes.draw do
  get 'questions/index'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tips do
    resources :comments
  end 
  
  root 'welcome#index'
end
