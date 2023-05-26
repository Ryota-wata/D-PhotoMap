class DiariesController < ApplicationController
    before_action :set_diary, only: [:edit, :update, :destroy]
    
    def index
        @tags = Tag.all
        @diaries = current_user.diaries.order(day: :desc)
    end
    
    def new
        @diary = Diary.new
    end

    def edit
        @tag_list = @diary.tags.pluck(:name).join('、') 
    end
    
    def create
        @diary = current_user.diaries.build(diary_params)
        sent_tags = params[:diary][:tag].split('、')
        if @diary.save
            @diary.save_tag(sent_tags)
            redirect_to diaries_path, success: t('.success')
        else
            flash.now[:danger] = t('.fail')
            render :new
        end
    end
    
    def update
        sent_tags = params[:diary][:tag].split('、')
        if @diary.update(diary_params)
            @diary.save_tag(sent_tags)
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

    # タグ検索
    def search
        @tag = Tag.find(params[:tag_id])
        @diaries = @tag.diaries.where(user_id: current_user.id)
    end
    
    private
       
    def set_diary
        @diary = current_user.diaries.find(params[:id])
    end
    
    def diary_params
        params.require(:diary).permit(:day, :title, :body, :user_id)
    end
end
