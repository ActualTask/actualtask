class InfosController < ApplicationController


  def show
    @info = Info.find(params[:id])
  end
end

  private

def info_params
  params.require(:info).permit(:name, :surname, :dob, :about, :phone)
end

