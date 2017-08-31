
class TasksController < ApplicationController
  before_action :set_post, only: :show



  def show
  end

  private

  def set_post
    @task = Task.find(params[:id])
  end
end