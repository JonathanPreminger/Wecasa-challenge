class PrestationsController < ApplicationController
  def create
    @prestation = Prestation.create(prestation_params)
  end
  def index
    @prestations  = Prestation.all
  end

  private

  def prestation_params
    params.permit(:prestation).require(:reference, :duration, pro:[])
  end
end
