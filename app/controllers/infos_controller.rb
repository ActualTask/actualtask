class InfosController < ApplicationController


  def show
    @info = Info.find(params[:id])
    @location = Location.find(@info.location_id)
  end
end

  private

def info_params
  params.require(:info).permit(:name, :surname, :dob, :about, :phone)
end
def location_params
  params.require(:location).permit(:address)
end

