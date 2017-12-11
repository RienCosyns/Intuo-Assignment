class FridgesController < ApplicationController

  def index 
    @fridges = Fridge.all
    render json :@fridges
  end

  def show
    @fridge = Fridge.find(params[:id])
    render json :@fridge
  end
end
