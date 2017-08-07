class Search < ApplicationRecord
  def tasks
    @tasks ||= find_tasks
  end




private

def find_tasks
  tasks = Task.order(:name)
  tasks = task.where("title LIKE ? ", "%#{title}%") if title.present?
  tasks = task.where(category_id: category_id) if category_id.present?
  tasks = task.where("price >= ?", min_price) if min_price. present?
  tasks = task.where("price <= ?", max_price) if max_price. present?

end
end
