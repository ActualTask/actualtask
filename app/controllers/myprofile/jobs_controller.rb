class Myprofile::JobsController < Myprofile::MyprofileController

before_action :authenticate_user!

  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_job, only: [:task_done, :cancel_response, :cancel_job]




  def index
    @jobs = current_user.jobs
    @tasks = @jobs.paginate(page: params[:page], per_page: 5)
    @responded_tasks = current_user.responded_tasks
    @responses = @responded_tasks.paginate(page: params[:page], per_page: 5)
  end

  def show
    @response = current_user.response_lists.find_by task_id: @task.id
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
      flash.now[:danger] = 'Что-то пошло не так'
      render @task
      #create here
    end
  end

  def cancel_response
    @response = ResponseList.find(find_response[:response_id])
    if (@response.update_attributes('response_status'=>'response_canceled')&&@task.update_attributes('performer_id' => nil))
      redirect_to myprofile_job_path(@task), success: 'Отклик отозван'
    end

  end

  def cancel_job
    @response = ResponseList.find(find_response[:response_id])
    if (@response.update_attributes('response_status'=>'job_canceled')&&@task.update_attributes('performer_id' => nil))
      redirect_to myprofile_jobs_path, success: 'Вы отказались от задания'
    end
  end
  def task_done
   @task.task_status = 'done'
   if @task.save
     redirect_to myprofile_job_path(@task), success: 'Ожидает принятия'
   end
 end


  private

  def set_task
    @task = Task.find(params[:id])
  end
def set_job
  @task = Task.find(params[:job_id])
end

def find_response
  params.permit(:response_id)
end

  def task_params
    params.require(:task).permit(:title, :body, :all_tags, :price_max, :price_min, :category_id, {attachments: []},  :location_attributes => [:address, :_destroy, :id, :task_id] )
  end

  def response_params
    params.permit(:response_text, :task_id)
  end
end



