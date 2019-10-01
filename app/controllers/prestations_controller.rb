class PrestationsController < ApplicationController
  def create
    @prestation = Prestation.create(prestation_params)
  end
  def index
    @prestations  = Prestation.all
    if @prestations.blank?
    Prestation.populate_from_json
    puts '_______________________________________________________________all'
    puts Prestation.all
    end
  end

  private

  def prestation_params
    params.permit(:prestation).require(:reference, :duration, pro:[])
  end
end
