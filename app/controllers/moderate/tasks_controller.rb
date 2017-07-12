class Moderate::TasksController < Moderate::ModerateController

  before_action :set_task, only: [:show, :update]

  def index
    @posted_tasks = Task.where(tasks_verified: 'created')
    @tasks = @posted_tasks.paginate(:page => params[:page], :per_page => 5)
  end

  def show
  end

  def update
    if @task.update_attributes(task_params) #:tasks_verified=>params[:task][:tasks_verified]
      redirect_to moderate_tasks_path, success:'Модерация прошла успешно'
    else
      flash.now[:danger] = 'Что то пошло не так'
      render :show
    end
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:tasks_verified)
  end
end
