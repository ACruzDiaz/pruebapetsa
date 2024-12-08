Rails.application.routes.draw do
  scope "(:locale)", locale: /en|es/ do
    root to: redirect("notes")
  end
  resources :notes
end
