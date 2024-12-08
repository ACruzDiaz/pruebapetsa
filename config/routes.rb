Rails.application.routes.draw do
  
  scope "(:locale)", locale: /en|es/ do
    resources :notes, path: ''
    root to: "notes#index"
    
  end
end
