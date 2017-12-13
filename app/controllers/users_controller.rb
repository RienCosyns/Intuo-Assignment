class UsersController < ApplicationController

  def index
    @users = User.all
    filtering_params(params).each do |key, value|
      @users = @users.public_send(key, value) if value.present?
      end
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def pets
    @user_pets = User.find(params[:id]).pets
    render json: @user_pets
  end

  def fridge
    @user_fridge = User.find(params[:id]).fridge
    render json: @user_fridge
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end

  private 
    def filtering_params(params)
      params.slice(:fridge_type, 
      :fridge_last_checkup_before, 
      :fridge_last_checkup_after, 
      :pet_type,
      :food_type,
      :carrot_color,
      :brand_name
      )
    end

end
