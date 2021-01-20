class StaticController < ApplicationController
  def about
    # default without render is app/view/home.html.erb
    #
    # Implicit Rendering Convention
    # app/views/static/about.html.erb
  end

  def team
    # explicit rendering
    render 'content/team'
  end
end
