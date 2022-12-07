class PlantsController < ApplicationController

    wrap_parameters format: []

    def index 
        plant = Plant.all 
        render json: plant, status: :ok
    end

    def create 
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    def show 
        plant = Plant.find_by(id: params[:id])
        if plant 
            render json: plant, status: :ok 
        else 
            render json: {error: "Could not find this plant."}, status: :not_found
        end
    end

    private 

    def plant_params
        params.permit(:name, :image, :price)
    end
end
