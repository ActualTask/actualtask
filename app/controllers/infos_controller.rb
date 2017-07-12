class InfosController < ApplicationController

  def index
    #@performers = Performer.new
    @infos = Info.new
  end

  def new
    @info = Info.new
  end

  def edit

  end


  def create
    @info = Info.new(info_params)
    @info.user_id = current_user.id
    if @info.save
      redirect_to @info, success: 'Анкета успешно создана'
    else
      flash.now[:danger]= 'Анкета не создана'
      render :new
    end
    end

  def show
    @info = Info.find(params[:id])
  end
end

  private

def info_params
  params.require(:info).permit(:name, :surname, :location, :dob, :about, :phone)
end