Rails.application.routes.draw do
  get 'profile' , to: "user#show"
  get 'test/show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
