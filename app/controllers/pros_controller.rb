class ProsController < ApplicationController
  def create
    @pro = Pro.create(pro_params)
  end
  def index
    @pros  = Pro.all
    end
  end

  private

  def pro_params
    params.permit(:pro).require(:name, :address, :lat, :lng, :max_kilometers, prestations_ids: [])
  end

end
