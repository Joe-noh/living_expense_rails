class ExpensesController < ApplicationController

  respond_to :html

  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
    @expense.items.build
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  def update
    @expense = Expense.find(params[:id])

    if @expense.update_attributes(expense_params)
      redirect_to root_path
    else
      render action: "edit"
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    redirect_to root_path
  end

  def stat
    integral = 0
    @series = Expense.all.each_with_object({}) { |expense, hash|
      integral += (expense.income? ? 1 : -1) * expense.amount_total
      hash[expense.payday] = integral
    }

    @num_responsible = Expense.all.group_by(&:responsible).map { |name, expenses|
      [name, expenses.count]
    }
  end

  private

  def expense_params
    params.require("expense").permit(:purpose, :responsible, :payday, :in_out,
                                     items_attributes: [:id, :name, :count, :unit_price, :_delete])
  end
end
