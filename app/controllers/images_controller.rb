class ImagesController < ActionController::Base

  def index
    @images = Image.all
  end


  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_path
  end

  def new
    @image = Image.new
  end

  def create
    image = Image.new(image_params)
    if image.save
      redirect_to images_path
    else
      render :new
    end
  end

  private

  def image_params
    params.require(:image).permit(:title, :image_path)
  end

end
