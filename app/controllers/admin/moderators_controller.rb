class Admin::ModeratorsController < Admin::AdminController



  def index
    @moderators = Moderator.all

  end
  def new
    @moderator = Moderator.new

  end

  def moderate

  end

  def destroy
    @moderator = Moderator.find(params[:id])

    @moderator.destroy
    redirect_to admin_moderator_path, success: 'Модератор удален'
  end

  def create
    @user = User.new(:email=>params[:email], :password=>params[:password], :moderator=>'true')
    if @user.save
      @moderator = Moderator.new(mod_params)
      @moderator.user_id = @user.id
      if @moderator.save
        redirect_to admin_moderators_path, success: 'Модератор создан'
      else
        flash.now[:danger]= 'Модератор не создан'
        render :new
      end
    else
      flash.now[:danger]= 'Модератор не создан'
      redirect_to admin_moderators_path, success: 'Модератор создан'

    end
  end

  private
  def mod_params
    params.require(:moderator).permit(:login, :name, :last_name, :password, :email)

  end
end
