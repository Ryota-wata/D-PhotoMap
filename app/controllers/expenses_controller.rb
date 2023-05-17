class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :update, :destroy]

  def index
    @expenses = Expense.all.order(created_at: :desc)
  end

  def new
    @expense = Expense.new
    @expense_items = @expense.expense_items.build
  end

  def create
    @expense = current_user.expenses.build(expense_params)
    if @expense.save
      redirect_to expenses_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def show
    @expense = Expense.find(params[:id])
    @expense_items = @expense.expense_items
  end

  def edit
    @expense_items = @expense.expense_items
  end

  def update
    if @expense.update(expense_params)
      redirect_to expenses_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_path, success: t('.success')
  end

  private

  def expense_params
    params.require(:expense).permit(:day, :total, expense_items_attributes: [:id, :name, :price, :quantity, :subtotal, :_destroy])
  end

  def set_expense
    @expense = current_user.expenses.find(params[:id])
  end
end
