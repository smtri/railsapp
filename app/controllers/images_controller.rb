class ImagesController < ApplicationController
  before_action :find_user

  def index
    @images = @user.images.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = @user.images.create(image_params)

    if @image.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def update
    @image = Image.find(params[:id])
    ImagesWorker.perform_async(@image.id)
    redirect_to user_images_path
  end

  def destroy
=begin    @image = Image.find(params[:id])
    @image.destroy

    redirect_to user_images_path
=end

    @image = Image.find(params[:id])
    ImagesWorker.perform_async(@image.id)
    redirect_to user_images_path

  end

  private

    def find_user
      @user = User.find(params[:user_id])
    end

    def image_params
      params.require(:image).permit(:image, :user, :rotated)
    end
    
end
