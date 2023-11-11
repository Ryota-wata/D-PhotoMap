class UserSessionsController < ApplicationController
    skip_before_action :require_login, only: %i[new create guest_login]

    def new; end
    
    def create
        @user = login(params[:email], params[:password])
        if @user
            redirect_back_or_to photos_path, success: t('.success')
        else
            flash.now[:danger] = t('.fail')
            render :new
        end
    end
    
    def destroy
        logout
        redirect_to root_path, success: t('.success')
    end

  def guest_login
    @guest_user = User.create(
    username: 'ゲスト',
    email: SecureRandom.alphanumeric(10) + "@email.com",
    password: 'password',
    password_confirmation: 'password'
    )
    auto_login(@guest_user)
    redirect_back_or_to photos_path, success: 'ゲストとしてログインしました'
  end
end
