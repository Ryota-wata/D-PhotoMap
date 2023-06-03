class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :show]

  def index
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).includes(:user).order(deadline: :desc)
  end

  def new
    @task = Task.new
  end

  def edit; end

  def show; end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy
    @task.destroy!
    redirect_to tasks_path, success: t('.success')
  end

  private

  def task_params
    params.require(:task).permit(:title, :category, :content, :status, :deadline, images: [])
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
