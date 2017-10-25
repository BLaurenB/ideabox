class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def show

  end

  def edit

  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to ideas_path
  end


end
