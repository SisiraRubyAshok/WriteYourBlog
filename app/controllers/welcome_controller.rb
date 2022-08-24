class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @blogs = Blog.last(5)
  end
end
