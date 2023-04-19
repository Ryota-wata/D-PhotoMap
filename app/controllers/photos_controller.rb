class PhotosController < ApplicationController
  before_action :set_photo, only: [:edit, :update, :destroy]

  def new
    @photo = Photo.new
  end

  def edit ;end

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id]) 
  end

  def create
    @photo = current_user.posts.build(photo_params)
    if @photo.save
      redirect_to photos_path, notice: '写真を投稿しました'
    else
      render :new
    end
  end

  def update
    if @photo.update(photo_params)
      redirect_to root_path, notice: '写真を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy!
    redirect_to root_path, notice: '写真を削除しました'
  end

  private

  def photo_params
    params.require(:photo).permit(:day, :park, :area, :body, :image, :image_cache, :latitude, :longitude, :user_id)
  end

  def set_photo
    @photo = current_user.posts.find(params[:id])
  end
end
