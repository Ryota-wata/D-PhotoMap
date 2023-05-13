class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]
  
  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: '更新しました'
    else
      flash.now['danger'] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy!
    redirect_to root_path, success: '退会しました'
  end

  def show; end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :username)
  end

end
