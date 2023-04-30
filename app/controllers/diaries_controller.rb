class DiariesController < ApplicationController
    before_action :set_diary, only: [:edit, :update, :destroy]
    
    def index
        @diaries = current_user.diaries.order(day: :desc)
    end

    def show 
        @diary = Diary.find(params[:id])
    end
    
    def new
        @diary = Diary.new
    end

    def edit ;end
    
    def create
        @diary = current_user.diaries.build(diary_params)
        if @diary.save
            redirect_to diaries_path, success: t('.success')
        else
            flash.now[:danger] = t('.fail')
            render :new
        end
    end
    
    def update
        if @diary.update(diary_params)
            redirect_to diaries_path, success: t('.success')
        else
            flash.now[:danger] = t('.fail')
            render :edit  
        end
    end
    
    def destroy
        @diary.destroy!
        redirect_to diaries_path, success: t('.success')
    end

    # 抽選結果
    def lottely
        @diaries = Diary.all
    end
    
    private
       
    def set_diary
        @diary = current_user.diaries.find(params[:id])
    end
    
    def diary_params
        params.require(:diary).permit(:day, :title, :body, :user_id)
    end
end
