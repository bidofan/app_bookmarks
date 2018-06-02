class HomeController < ApplicationController
  def index
    @users = User.all.collect(&:name)
  end
end
