class Admin::CategoriesController < Admin::BaseController

  before_action :require_admin

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.save
      redirect_to admin_category_path(category)
    else
      render :new
    end
  end

  def show
    # byebug
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)

    if @category.save
      redirect_to admin_category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end


  private

  def category_params
    params.require(:category).permit(:title)
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end

  def current_admin?
    current_user && current_user.admin?
  end


end
