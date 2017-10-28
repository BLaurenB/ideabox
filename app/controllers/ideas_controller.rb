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
    @idea = Idea.find(params[:id])
  end

  def new
    @categories = Category.all
    @images = Image.all #.shuffle
    @idea = Idea.new
  end

  def create
    idea = Idea.new(idea_params)
    idea.images << Image.find((params[:idea][:id]).reject { |id| id.empty? })
    if idea.save
      redirect_to idea_path(idea)
    else
      flash[:error] = "Please try again"
      @idea = Idea.new
      @categories = Category.all
      @images = Image.all
      render :new
    end
  end

  def edit
    @idea = Idea.find(params[:id])
    @categories = Category.all
    @images = Image.all
  end

  def update

    idea = Idea.find(params[:id])
    idea.update(idea_params)
    idea.images.clear #the browser doesn't like .images, regardless of if I try  = nil or .clear or shoveling!
    #need logic here to either get rid of al images for the idea and re-add them, or to check through all the images for ones that were deleted or being added... I think the shortest solution is to delete all images and re-post each time.
    idea.images << Image.find((params[:idea][:id]).reject { |id| id.empty? })

    if idea.save
      redirect_to idea_path(idea)
    else
      flash[:error] = "Please try again"
      @idea = Idea.new
      @categories = Category.all
      @images = Image.all
      render :edit
    end
  end


  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to ideas_path
  end


  private

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id)
  end

end
