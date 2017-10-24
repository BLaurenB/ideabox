class IdeasController < ActionController::Base

  def index
    @ideas = Idea.all
  end

  def show

  end

  def edit

  end 


end
