class ImagesController < ApplicationController

  def index
    @image = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @user = User.find(params[:user_id])
    @image = @user.images.new(image_params)

    if @image.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to images_path    
  end

  private
    def image_params
      params.require(:image).permit(:user)
    end
    
end
