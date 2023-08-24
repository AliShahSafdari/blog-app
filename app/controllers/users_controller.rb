class UsersController < ApplicationController
  def index
  @Users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
