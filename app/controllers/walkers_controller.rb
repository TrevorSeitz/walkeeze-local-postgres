class WalkersController < ApplicationController
  def new
    @walker = Walker.new
  end

  def index
    @walkers = Walker.all
  end

  def show
    @dogs = Dog.where(user_id: @user.id)
  end

  def update
    @walker = Walker.find(params[:id])
    @walker.update(name: params[:name], email: params[:email])
    byebug

    redirect_to walker_path(@walker), notice: "Update Successful"
  end


  def edit
    # byebug
    @walker = Walker.find(params[:id].to_i)
  end

end
