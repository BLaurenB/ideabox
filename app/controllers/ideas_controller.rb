class IdeasController < ApplicationController
  before_action :require_user


  def require_user
    render file: "/public/404" unless logged_in_user?
  end

  def logged_in_user?
    current_user && (current_user.default? || current_user.admin?)
  end


  def index
    @ideas = current_user.ideas.all
  end

  def show
    @idea = current_user.ideas.find(params[:id])
  end

  def new
    @categories = Category.all
    @images = Image.all
    @idea = current_user.ideas.new
  end

  def create
    idea = current_user.ideas.new(idea_params)
    idea.user_id = current_user.id
    idea.images << Image.find((params[:idea][:id]).reject { |id| id.empty? })
    # needed to add the reject because the inital array value is empty
    if idea.save
      redirect_to idea_path(idea)
    else
      flash[:error] = "Please try again"
      @idea = current_user.ideas.new
      @categories = Category.all
      @images = Image.all
      render :new
    end
  end

  def edit
    @idea = current_user.ideas.find(params[:id])
    @categories = Category.all
    @images = Image.all
  end

  def update

    idea = current_user.ideas.find(params[:id])
    idea.update(idea_params)
    idea.images.clear 
    idea.images << Image.find((params[:idea][:id]).reject { |id| id.empty? })

    if idea.save
      redirect_to idea_path(idea)
    else
      flash[:error] = "Please try again"
      @idea = current_user.ideas.new
      @categories = Category.all
      @images = Image.all
      render :edit
    end
  end


  def destroy
    @idea = current_user.ideas.find(params[:id])
    @idea.destroy
    redirect_to ideas_path
  end


  private

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id)
  end

end
