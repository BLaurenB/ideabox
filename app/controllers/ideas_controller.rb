class IdeasController < ApplicationController
  before_action :require_user


  def require_user
    render file: "/public/404" unless logged_in_user?
  end

  def logged_in_user?
    current_user && (current_user.default? || current_user.admin?)
  end


  def index
    @ideas = Idea.all
  end

  def show

  end

  def new
  end 

  def edit

  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to ideas_path
  end


end
