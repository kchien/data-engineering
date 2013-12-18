RevenueApp::Application.routes.draw do
  resources :revenues, except: [:edit]
end
