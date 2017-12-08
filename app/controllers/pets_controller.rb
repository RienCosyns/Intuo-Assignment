class PetsController < ApplicationController

  def index
    if params[:animal_type]
      filter_pets
    else
      @pets = Pet.all
    end

    render json: @pets
  end

  def show
    @pet = Pet.find(params[:id])
    render json: @pet
  end

  private
    def filter_pets
      # if params[:operator] == 'older'
      #   @pets = Pet.where("animal_type = :animal AND age >= :age", 
      #                   {animal: params[:animal_type], age: params[:age]})
      # elsif params[:operator] == 'younger'
      #   @pets = Pet.where("animal_type = :animal AND age <= :age", 
      #                     {animal: params[:animal_type], age: params[:age]})
      # else
      #   @pets = Pet.where("animal_type = :animal", {animal: params[:animal_type]})
      # end

      if params[:age]
        @pets = Pet.where("animal_type = ? AND age #{params[:operator]} ?", 
                        params[:animal_type].capitalize, params[:age])
      else
        @pets = Pet.where("animal_type = ?", params[:animal_type].capitalize)
      end
    end
end
