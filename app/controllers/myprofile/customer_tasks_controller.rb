class Myprofile::CustomerTasksController < Myprofile::MyprofileController

  before_action :authenticate_user!

  before_action :set_task, only: [ :show, :edit, :update, :destroy]

  before_action :set_response, only: [:accept_response, :decline_response]

  before_action :set_customer_task, only: [:accept_response, :decline_response]

  before_action :check_info, only: [:create, :new, :update]


  def index
    @posted_tasks = current_user.tasks
    @tasks = @posted_tasks.paginate(page: params[:page])
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
    track_activity @customer_task
    if @customer_task.save
      redirect_to myprofile_task_path(@customer_task), success: 'Успех'
    else
      flash.now[:danger]
      render :new

    end
  end

  def edit
  end

  def accept_response
    if @customer_task.update_attributes('performer_id' => @response.performer_id, )&&@response.update_attributes('response_status' => 'accepted')&&@customer_task.update_attributes('task_status' => 'in work' )



      redirect_to @customer_task, success: set_response_params
    else
      flash.now[:danger] = 'Что-то пошло не так'
      render @customer_task
      end

    end

  def decline_response
    if @customer_task.update_attributes('performer_id'=> nil )&&@response.update_attributes('response_status' => 'declined')

      redirect_to @customer_task, success: set_response_params
    else
      flash.now[:danger] = 'Что-то пошло не так'
      render @customer_task
    end

  end

  def update
    if @customer_task.update_attributes(task_params)
      track_activity @customer_task

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

    ResponseList.response_status = 'created'


    @response.performer_id = current_user.id
    if @response.save
      redirect_to @customer_task
    else
      flash.now[:danger] = 'Что-то не так'
      render @customer_task
      #create here
    end
  end

  def add_review
    @customer_task = Task.find(review_params[:task_id])
    @review = Review.new(review_params)
    @review.user_reviewed = @customer_task.performer_id
    if @review.save
      redirect_to myprofile_task_path(@customer_task), success: 'Вы оставили отзыв'
    else
      redirect_to myprofile_task_path(@customer_task), error: 'Вы не оставили отзыв'
    end
  end



  private

  def set_price_limit
    @price_limit = 500
  end
  def set_task
    @customer_task = Task.find(params[:id])
  end


  def set_response
    @response = ResponseList.find(set_response_params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :start_time, :end_time, :body, :all_tags, :price, :price_max, :price_min, :category_id, :remote_attachments_url, :remove_attachments, {attachments: []},  :locations_attributes => [:id, :address, :_destroy] )
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
  def review_params
    params.permit(:text, :task_id)
  end

  def check_info
    if current_user.info.nil?
       redirect_to(new_myprofile_info_path, {:flash => { :error => "Заполните информацию о себе!" }})
    end
  end

end