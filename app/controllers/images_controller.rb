class ImagesController < ApplicationController
def index
    @user = User.find(params[:users_id])
    @images = @user.images.order("order_id")
  end

  def upload_image   
    DataFile.save_file(params[:upload])
    redirect_to images_path(:users_id => params[:users_id])
end
