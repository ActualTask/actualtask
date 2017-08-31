class CommentsController < ApplicationController
  def show

  end


  def create
    @task = Task.find(params[:post_id])
    @comment = @task.comments.create(params[:comment])
    redirect_to task_path(@task)
  end


end

