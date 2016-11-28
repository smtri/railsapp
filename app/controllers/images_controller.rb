class ImagesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @image = @user.images.create(image_params)
    redirect_to user_path(@user)
  end

  private
    def image_params
      params.require(:image).permit(:user)
    end

end
