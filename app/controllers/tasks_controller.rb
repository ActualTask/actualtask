class TasksController < ApplicationController


  add_flash_types :error





  before_action :authenticate_user!

  before_action :check_info, only: [:create, :new, :update]

  before_action :check_info, only: [:create, :new, :update]

  before_action :set_task, only: [:show, :edit, :update, :destroy]






  def index
    # @search = Task.search(params[:q])
    @tasks = Task.paginate(page: params[:page], per_page: 16)
    @posted_tasks = Task.where(nil)
    # @posted_tasks = Task.where(tasks_verified: 'verified')
    @posted_tasks = @posted_tasks .where(id: Location.where('city=?',params[:location][:term]).select('task_id')) if params[:location]
    @posted_tasks = @posted_tasks .by_category(params[:category_translit]) if params[:category_translit]

  end

  def show
      if @task.user==current_user
        @responses = @task.response_lists
      else
        @responses = @task.response_lists.where('performer_id=?',current_user.id)
      end
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




  def add_response
    current_user.performer_role?
    @task = Task.find(response_params[:task_id])

    @response = ResponseList.new(response_params)

    @response.response_status = 'created'


    @response.performer_id = current_user.id
    if @response.save
      redirect_to @task
    else
      flash.now[:danger] = 'Что-то не так'
      render @task
      #create here
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
    params.require(:task).permit(:title, :body, :all_tags, :price, :price_max, :price_min, :category_id, :term, {attachments: []},  :location_attributes => [:address, :_destroy, :id, :task_id]  )
  end

  def response_params
    params.permit(:response_text, :task_id, :performer_price)
  end

  def set_response_params
    params.require(:response).permit(:id)
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


