class PerformersController < ApplicationController
  def new
    @performer = Performer.new
  end

  def create

    @performer = Performer.new(performer_params)
    @performer.user_id = current_user.id
    if @performer.save
      redirect_to new_performer_path, success: 'Данные успешно загружены'
    else
      flash.now[:danger] = 'Загрузите фото'
    end
  end

private
  def performer_params
  params.require(:performer).permit(:photo_id_1, :photo_id_2)
  end


end


