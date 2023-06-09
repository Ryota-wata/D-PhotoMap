class LotteliesController < ApplicationController
  before_action :set_lottely, only: [:edit, :update, :destroy]

  def index
    @q = current_user.lottelies.ransack(params[:q])
    @lottelies = @q.result(distinct: true).includes(:user).order(day: :desc)
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
    params.require(:lottely).permit(:day, :day_of_week, :facility, :time, :start_time, :result)
  end

  def set_lottely
    @lottely = current_user.lottelies.find(params[:id])
  end
end
