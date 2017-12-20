module ApplicationHelper

  def gravatar_for(user, opts = {})
    opts[:alt] = user.name
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}",
              opts
  end
  def task_map(task)
    if task.locations.any?
      map = "http://maps.google.com/maps/api/staticmap?size=262x175&sensor=false"
      task.locations.each_with_index do |loc,index|
        map+="&markers=label:"+(index+1).to_s+"%7C"+loc.latitude.to_s+","+loc.longitude.to_s
      end
      map+="&key=AIzaSyBdk5XNuueyFw1PSv5QCdWTCRiVmKkDhVY"
      image_tag map
    end
  end
  def task_interactive_map(task)
    '<iframe width="600" height="450" frameborder="0" style="border:0"
src="https://www.google.com/maps/embed/v1/undefined?origin=...&q=...&destination=...&center=...&zoom=...&key=..." allowfullscreen></iframe>'
  end
  def user_avatar(user)
    avatar_url = 'default-avatar.jpg'
    if user.info.present?
      if user.info.avatar?
        if user.info.avatar.thumb.file.present?
          avatar_url = current_user.info.avatar.url(:thumb)
        end
      end
    end
    image_tag avatar_url
  end
end
