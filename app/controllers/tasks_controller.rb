class TasksController < ApplicationController


  add_flash_types :error

  before_action :authenticate_user!

  before_action :check_info, only: [:create, :new, :update]

  before_action :check_info, only: [:create, :new, :update]

  before_action :set_task, only: [:show, :edit, :update, :destroy]



  def index
    @search = Task.search(params[:q])
    @posted_tasks = Task.where(tasks_verified: 'verified')
    @posted_tasks = @search.result
end

    def show

  end

  def new
    @task = Task.new
    @task.task_locatings.build.build_location
  end

  def create

    @task = Task.new(task_params)
    @task.user_id=current_user.id
    @task.tasks_verified = 'created'
    if @task.save
      redirect_to @task, success: 'Задание успешно создано'
    else
    flash.now[:danger]= 'Задание не создано'
      render :new

    end
  end




  def edit

  end


  def update
  if @task.update_attributes(task_params)
    track_activity @task
    redirect_to @task, success: 'Задание обновлено'
  else
    flash.now[:danger] = 'Задание не обновлено'
        render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, success: 'Задание удалено'
  end


  private

  def set_task
    @task = Task.find(params[:id])
  end



  def task_params
    params.require(:task).permit(:title, :body, :all_tags, :price, :price_max, :price_min, :category_id, {attachments: []},  :location_attributes => [:address, :_destroy, :id, :task_id]  )
  end

  def response_params
    params.permit(:response_text, :task_id, :performer_price)
  end

  def review_params
    params.permit(:text, :task_id)
  end

  def check_info
  if current_user.info.present?
  else
    flash.now[:danger] = 'Заполните данные'
    redirect_to  new_myprofile_info_path, :error => 'Вы должны указать информацию о себе', data: {confirm: 'Заполните личные данные?' }
  end
  end

  end


