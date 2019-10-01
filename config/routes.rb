Rails.application.routes.draw do
  root 'main#index'
  get 'recist', to: 'main#recist'
  post 'sendMessage', to: 'main#send_message' 
end