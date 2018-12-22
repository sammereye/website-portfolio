Rails.application.routes.draw do
  root 'main#index'
  match '/eft' => redirect('/eft/'). via :all
end