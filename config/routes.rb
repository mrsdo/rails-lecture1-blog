Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get({'hello_world' => 'posts#home'})
  #     URL              Class#method

  # Get All Posts
  get '/posts' => 'posts#index'

  # Get /posts/:id = one post by id
  get '/posts/:id' => 'posts#show', as: :post

  # GET /about -> StatisController#about
  get '/about' => 'static#about', :as => :about
  #                              (alias?)
  # GET /team -> StaticController#team
  get '/team' => 'static#team'
end
