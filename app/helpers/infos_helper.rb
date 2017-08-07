module InfosHelper
  def avatar_for(current_user, options = {size:100})
    size = options[:size]
    if current_user.avatar?
      image_tag current_user.info.avatar.url(:thumb), width: size, hight: size
    else
      image_tag "default-avatar.jpg", width: size
    end

  end
end