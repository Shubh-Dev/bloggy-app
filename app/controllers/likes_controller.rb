class LikesController < ApplicationController
  def index
    @user = User.all
  end
end
