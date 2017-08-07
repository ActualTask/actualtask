class SearchesController < ApplicationController

  def new
    @search = Search.new
  end

  def create
    @search = Search.create(seach_params[:search])
    redirect_to @search
  end

  def show
    @search = Search.find (params[:id])
  end
end


private

def seach_params
  params.require(:search).permit(:title, :min_price, :max_price, :category_id)
end