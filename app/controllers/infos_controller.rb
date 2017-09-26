class InfosController < ApplicationController



  def show
    @info = Info.find(params[:id])
  end
end



  private

def info_params
  params.require(:info).permit(:name, :surname, :dob, :about, :phone, :address, :avatar, :remove_avatar,:remote_avatar_url)
end

def set_info
  @info = Info.find(params[:id])
end

