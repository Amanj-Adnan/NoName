Rails.application.routes.draw do
  root  "home#show"
  get "sign_up" , to: "register#create"
  post "sign_up" , to: "register#created"
  delete "logout", to: "logout#destroy"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
