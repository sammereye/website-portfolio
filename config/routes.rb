Rails.application.routes.draw do
  root 'main#index'
  post 'sendMessage', to: 'main#send_message' 
end