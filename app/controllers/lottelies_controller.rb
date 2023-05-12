class LotteliesController < ApplicationController
  before_action :set_lottely, only: [:edit, :update, :destroy]

  def index
    @q = current_user.lottelies.ransack(params[:q])
    if params[:q] && params[:q][:day_wday].present?
      day_wday = params[:q][:day_wday].to_i
      @q = @q.where("strftime('%w', day) = ?", day_wday)
    end
    @lottelies = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def new
    @lottely = Lottely.new
  end

  def edit ;end

  def create
    @lottely = current_user.lottelies.build(lottely_params)
    if @lottely.save
      redirect_to lottelies_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def update
    if @lottely.update(lottely_params)
      redirect_to lottelies_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy
    @lottely.destroy!
    redirect_to lottelies_path, success: t('.success')
  end

  private

  def lottely_params
    params.require(:lottely).permit(:day, :facility, :time, :result)
  end

  def set_lottely
    @lottely = current_user.lottelies.find(params[:id])
  end
end
