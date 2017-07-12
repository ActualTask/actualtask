class TasksController < ApplicationController

  before_action :authenticate_user!

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @posted_tasks = Task.where(tasks_verified: 'verified')
    @tasks = @posted_tasks.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @task = Task.new
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
    params.require(:task).permit(:title, :summary, :body, :images, :all_tags, :category_id)
  end
end
