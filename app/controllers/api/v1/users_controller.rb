module Api
  module V1
    class UsersController < ApplicationController
      respond_to :json, :html
      before_action :find_user, only: [:show, :edit, :update, :destroy]

      def index
        @users = User.all
        respond_with @users
      end

      def show
        @images = @user.images
        rescue ActiveRecord::RecordNotFound
        respond_with @images
      end

=begin
      def new
        @user = User.new
      end

      def edit
      end

      def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to @user
        else

          render 'new'
        end
      end

      def update
        if @user.update(user_params)
          redirect_to @user
        else
          render 'edit'
        end
      end

      def destroy
        @user.destroy

        redirect_to users_path
      end
=end

      private

      def find_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:id, :name, :email, :password, :image)
      end
    end
  end
end

