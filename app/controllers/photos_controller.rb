class PhotosController < ApplicationController
  before_action :set_photo, only: [:edit, :show, :update, :destroy]

  def new
    @photo = Photo.new
  end

  def edit ;end

  def index
    @q = current_user.photos.ransack(params[:q])
    @photos = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def show ;end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to photos_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def update
    if @photo.update(photo_params)
      redirect_to photos_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy
    @photo.destroy!
    redirect_to photos_path, success: t('.success')
  end

  private

  def photo_params
    params.require(:photo).permit(:day, :park, :area, :body, :image, :image_cache, :latitude, :longitude)
  end

  def set_photo
    @photo = current_user.photos.find(params[:id])
  end

end
