class InfosController < ApplicationController

  before_action :set_info, only: [:show, :edit, :update]



  def show
    @info = Info.find(params[:id])
  end
end


  private

def info_params
  params.require(:info).permit(:name, :surname, :dob, :about, :phone, :avatar)
end

def set_info
  @info = Info.find(params[:id])
end
