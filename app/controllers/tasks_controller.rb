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

  def add_response
    current_user.performer_role?
    @task = Task.find(response_params[:task_id])
    @response = ResponseList.new(response_params)
    @response.performer_id = current_user.id
    if @response.save
      redirect_to @task
    else
      flash.now[:danger] = 'huita'
      render @task
    #create here
    end
  end


  private

  def set_task
    @task = Task.find(params[:id])
  end


  def task_params
    params.require(:task).permit(:title, :body, :all_tags, :price_max, :price_min, :category_id,  :location_attributes => [:address, :_destroy, :id, :task_id] )
  end

  def response_params
    params.permit(:response_text, :task_id)
  end

  end

