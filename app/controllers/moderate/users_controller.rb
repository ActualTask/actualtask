class Moderate::UsersController < Moderate::ModerateController

  before_action :set_user, only: [:show, :update]

  def index
    @has_performer = User.joins("LEFT OUTER JOIN performers ON performers.user_id = users.id").where(["performers.id IS NOT null AND users.performer_role = ?", false])
    #@performer = user.where(users_verified: 'created') #обратиться к перформеру через юзера
    @users = @has_performer.paginate(:page => params[:page], :per_page => 5)
  end

  def show
  end

  def verify
    user.achievements.create('name' => 'verify')
    @price==500

  end


  def update
      if @user.update_attributes(user_params) #:tasks_verified=>params[:task][:tasks_verified]
        redirect_to moderate_users_path, success:'Модерация прошла успешно'
      else
        flash.now[:danger] = 'Что то пошло не так'
        render :show
      end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:performer_role)
  end
end
