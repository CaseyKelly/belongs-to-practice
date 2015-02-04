class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
    @user = User.find(params[:user_id])
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user_id = params[:user_id]
    @user = User.find(params[:user_id])
      if @dog.save
        redirect_to users_path
          else
            render @user
      end
  end

  private
  def dog_params
     params.require(:dog).permit(:name, :breed, :age, :user_id)
  end

end
