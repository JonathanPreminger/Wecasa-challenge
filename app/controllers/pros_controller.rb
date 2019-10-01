class ProsController < ApplicationController
  def create
    @pro = Pro.create(pro_params)
  end
  def index
    @pros  = Pro.all
    if @pros.blank?
    Pro.populate_from_json
    redirect_to pros_path
    puts '_______________________________________________________________all'
    puts Pro.all
    end


  end

  private

  def pro_params
    params.permit(:pro).require(:name, :address, :lat, :lng, :max_kilometers, prestations_ids: [])
  end

end
