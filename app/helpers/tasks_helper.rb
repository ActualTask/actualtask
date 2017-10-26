module TasksHelper
  def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / max.count * (classes.size-1)
      yield(tag, classes[index.round])
    end
  end


  def task_info(task)

    info = "<time>#{task.created_at.to_date.strftime('%d %B, %Y')}</time> "




    if task.category.present?
      info += " | "+(link_to task.category.name, task.category)
    end
    if user_signed_in? && current_user.id==task.user_id
      info += " | "+(link_to 'Изменить', edit_myprofile_task_path(task))+" | "
      info += (link_to 'Удалить', myprofile_task_path(task), method: :delete, data: { confirm: 'Вы уверены?' })+" | "
    end

    info.html_safe
  end

end