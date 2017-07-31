class Myprofile::CustomerTasksController < Myprofile::MyprofileController

  before_action :authenticate_user!

  before_action :set_task, only: [ :show, :edit, :update, :destroy]

  before_action :set_response, only: [:accept_response, :decline_response]

  before_action :set_customer_task, only: [:accept_response, :decline_response]

  def index
    @posted_tasks = current_user.tasks
    @tasks = @posted_tasks.paginate(page: params[:page], per_page: 5)
  end

  def show

  end

  def new
    @customer_task = Task.new
  end

  def create
    @customer_task = Task.new(task_params)
    @customer_task.user_id=current_user.id
    @customer_task.tasks_verified = 'created'
    if @customer_task.save
      redirect_to myprofile_task_path(@customer_task), success: task_params
    else
      flash.now[:danger]= task_params
      render :new

    end
  end

  def edit
  end

  def accept_response
    if @customer_task.update_attributes('performer_id' => @response.performer_id)&&@response.update_attributes('response_status' => 'accepted')
    redirect_to @customer_task, success: set_response_params
    else
      flash.now[:danger] = 'Что-то пошло не так'+response_params
      render @customer_task
      end

    end

  def decline_response
    if @response.update_attributes('response_status' => 'declined')
      redirect_to @customer_task, success: set_response_params
    else
      flash.now[:danger] = 'Что-то пошло не так'
      render @customer_task
    end

  end

  def update
    if @customer_task.update_attributes(task_params)
      redirect_to myprofile_task_path(@customer_task), success: 'Задание обновлено'
    else
      flash.now[:danger] = 'Задание не обновлено'
      render :edit
    end
  end

  def destroy
    @customer_task.destroy
    redirect_to tasks_path, success: 'Задание удалено'
  end

  def add_response
    current_user.performer_role?
    @customer_task = Task.find(response_params[:task_id])
    @response = ResponseList.new(response_params)
    @response.performer_id = current_user.id
    if @response.save
      redirect_to @customer_task
    else
      flash.now[:danger] = 'huita'
      render @customer_task
      #create here
    end
  end


  private

  def set_task
    @customer_task = Task.find(params[:id])
  end


  def set_response
    @response = ResponseList.find(set_response_params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :body, :all_tags, :price_max, :price_min, :category_id,  :locations_attributes => [:id, :address, :_destroy] )
  end

  def response_params
    params.permit(:response_text, :task_id)
  end

  def set_response_params
    params.require(:response).permit(:id)
  end
  def set_customer_task
    @customer_task = Task.find(params[:task_id])
  end

end