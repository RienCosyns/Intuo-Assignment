class FridgesController < ApplicationController

  def index 
    @fridges = Fridge.all
    render json: @fridges
  end

  def show
    @fridge = Fridge.find(params[:id])
    render json: @fridge
  end

  def create
    @user = User.find(params[:id])
    @fridge = @user.build_fridge(type: params[:type], last_check_date: Date.today)
    if @fridge.save
      @user.has_fridge = true
      redirect_to user_path(params[:id])
    else
      render json: @fridge.errors.full_messages
    end
  end

end
