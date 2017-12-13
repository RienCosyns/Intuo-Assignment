class FoodsController < ApplicationController
  def index
    @foods = Food.all
    render json: @foods
  end

  def create
    @user = User.find(params[:id])
    params[:amount].to_i.times do |n|
      @food = @user.fridge.foods.build(
        type: params[:type],
        brand_name: params[:brand_name],
        size: params[:size],
        volume: params[:volume],
        color: params[:color],
        exp_date: rand(0..3).days.from_now
      )      
      render json: @user.errors.full_messages unless @food.save
    end
    redirect_to fridge_path(@user.fridge.id)
  end

  def destroy
    pet = Pet.find(params[:id])
    user = User.find_by(id: pet.user_id)
    fridge = Fridge.find_by(id: user.fridge.id)
    food = fridge.foods.find_by(type: params[:type])
    if pet.restricted_food.include? params[:type].downcase
      food.destroy
      redirect_to fridge_path(fridge.id)
    else
      render json: {params[:type]=> "can't be eaten by #{pet.type}"}
    end
  end
end
