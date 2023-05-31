class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:edit, :update, :destroy]

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = current_user.quizzes.build
  end

  def edit
  end

  def show
    @quiz = Quiz.find(params[:id])
    @comment = Comment.new
    @comments = @quiz.comments.includes(:user).order(created_at: :desc)
  end

  def create
    @quiz = current_user.quizzes.build(quiz_params)
    if @quiz.save
      redirect_to quizzes_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to quizzes_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_path, success: t('.success')
  end

  def answer
    @quiz = Quiz.find(params[:id])
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name, :question, :question_image, :answer, :description, :answer_image)
  end

  def set_quiz
    @quiz = current_user.quizzes.find(params[:id])
  end
end
