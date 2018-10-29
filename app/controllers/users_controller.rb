class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @dogs = Dog.where(user_id: @user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(name: params[:name], email: params[:email])

    redirect_to edit_user_path(@user), notice: "Update Successful"
  end


  def edit
    # byebug
    @user = User.find(params[:id].to_i)
  end

end
