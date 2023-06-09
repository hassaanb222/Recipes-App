class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @foods = Food.all.where(user_id: @user.id)
  end

  def new
    @food = Food.new
  end

  def create
    @user = current_user
    @food = Food.create(food_params)
    @food.user_id = @user.id
    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new
      flash[:alert] = 'Food was not created.'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
