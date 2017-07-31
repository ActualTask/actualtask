class Myprofile::InfosController < Myprofile::MyprofileController

  before_action :set_info, only: [:show, :edit, :update]


  def index
    @infos = Info.new
    @tasks = current_user.tasks
  end

  def new
    @info = Info.new
  end


  def edit
    if @info.update_attributes(info_params)
      redirect_to @info, success: 'Анкета обновлена'
    else
      flash.now[:danger] = 'Анкета не обновлена'
      render :edit
    end
  end


  def create

    @info = Info.new(info_params)
    @info.user_id = current_user.id
    if @info.save
      redirect_to myprofile_infos_path, success: 'Анкета успешно создана'
    else
      flash.now[:danger]= 'Анкета не создана'
      render :new
    end
  end

  def show
  end
end

  private

def info_params
  params.require(:info).permit(:name, :surname, :dob, :about, :phone, :address)
end

def set_info
  @info = Info.find(params[:id])
end