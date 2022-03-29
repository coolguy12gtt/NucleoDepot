 Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "genes#index"

  get "/genes", to: "genes#index"
  get "/genes/:id", to: "genes#show"
  get "/searchID", to: "genes#searchID"
  get "/searchName", to:"genes#searchName"
  get "/searchType", to: "genes#searchType"
  get "/searchInType", to: "genes#searchInType"
  get "/update", to: "genes#updateGenes"
  get "/searchWeb", to: "genes#searchWeb"
  get "/thx", to: "genes#thx"
  get "/about", to: "genes#about"
  get "/references", to: "genes#references"

  #resources :genes
end
