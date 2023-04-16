class DiariesController < ApplicationController
    before_action :set_diary, only: [:edit, :update, :destroy]
    
    def index
        @diaries = Diary.all
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
            redirect_to root_path, notice: '日記を投稿しました'
        else
            render :new
        end
    end
    
    def update
        if @diary.update(diary_params)
            redirect_to root_path, notice: '日記を更新しました'
        else
            render :edit  
        end
    end
    
    def destroy
        @diary.destroy!
        redirect_to root_path, notice: '日記を削除しました'
    end
    
    private
       
    def set_diary
        @diary = current_user.diaries.find(params[:id])
    end
    
    def diary_params
        params.require(:diary).permit(:day, :title, :body, :lottely_facility, :lottely_time, :lottely_result, :user_id)
    end
end
