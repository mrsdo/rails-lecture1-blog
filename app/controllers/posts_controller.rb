# frozen_string_literal: true

class PostsController < ApplicationController
  def home
    # default without render is app/view/home.html.erb
    #
    # pattern Implicit Rendering Convention
    # app/views/[controller_name]/[action_name].html.erb
  end

  def index
    # app/views/posts/index.html.erb
    # all blog posts
    # instance variables defined in the controller action
    # get passed to the view

    @post = Post.all
    render 'posts/index'
  end
end
