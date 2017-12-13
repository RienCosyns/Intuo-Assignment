class PetsController < ApplicationController

  def index
    @pets = Pet.all
    # @pets = Pet.type(params[:type]) if params[:type].present?
    # @pets = Pet.fav_food(params[:fav_food]) if params[:fav_food].present?
    filtering_params(params).each do |key, value|
      @pets = @pets.public_send(key, value) if value.present?
    end
    render json: @pets
  end

  def show
    @pet = Pet.find(params[:id])
    render json: @pet
  end

  def update
    @pet = Pet.find(params[:id])
    if params[:death]
      @pet.update_attribute(:date_of_death, Date.today)
    end
    if @pet.save
      render json: @pet
    else
      render json: @pet.errors.full_messages
    end
  end

  private

    def filtering_params(params)
      params.slice(:type, :fav_food, :older_than, :younger_than, :user)
    end

end
