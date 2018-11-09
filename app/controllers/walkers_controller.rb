class WalkersController < ApplicationController
  def new
    @user = User.new    
    # redirect_to '/users/new_walker'
  end

  def index
    @users = User.where(walker: true)
  end

  def show
    @dogs = Dog.where(user_id: @user.id)
    redirect_to user_path
  end

  def update
    @user = User.find(params[:id])
    @user.update(name: params[:name], email: params[:email])

    redirect_to walker_path(@user), notice: "Update Successful"
  end


  def edit
    # byebug
    @user = User.find(params[:id].to_i)
  end

end
