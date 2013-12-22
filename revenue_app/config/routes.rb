RevenueApp::Application.routes.draw do
  resources :revenues, except: [:edit]
  root "revenues#index"
end
