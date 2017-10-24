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
  end

end
