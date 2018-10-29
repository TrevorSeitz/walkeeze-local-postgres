class DogsController < ApplicationController

  def new
    @dog = Dog.new
  end

  def index
    @dogs = Dog.all
  end

  def create
    byebug
    @dog = current_user.dogs.build(dog_params)
    @dog.save
    if @dog.valid?
      render json: @dog, status: 201
    else
      redirect_to new_dog_path
    end
  end

  def update
    @dog = Dog.find(params[:id])
  end

  def show
    @dog = Dog.find(params[:id])
    @walks = @dog.walks
    render :json => {:dog => @dog, :walks=> @walks}
    # respond_to do |format|
    #   format.html
    #   format.json {render json: @dog, include: [:walks]} - use to add walks to dog show on user page
    # end
  end

  def schedule
    @dog = Dog.find(params[:id])
    @walks = @dog.walks
    render json: @walks, status: 201
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :user_id, :notes)
  end

end
