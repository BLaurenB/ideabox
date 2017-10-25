class IdeasController < ApplicationController

  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @ideas = @category.ideas
    else
      @category = Category.all
      @ideas = Idea.all
    end
  end

  def new
    @idea = Idea.new
    @categories = Category.all
    @images = Image.all
  end

  def create
    @category = Category.find(params[:idea][:category_id])
    @idea = @category.ideas.new(idea_params)
    if @idea.save
      redirect_to category_idea_path(@idea)
    else
      @categories = Category.all
      @images = Image.all
      render :new
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @ideas = @category.ideas
  end

  def edit

  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to category_ideas_path
  end


  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end


end
