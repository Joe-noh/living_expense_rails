class ExpensesController < ApplicationController

  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
    @expense.items.build

    respond_to do |format|
      if request.xhr?
        format.html { render "new", locals: { expense: @expense } }
      end
    end
  end

  def edit
    @expense = Expense.find(params[:id])

    respond_to do |format|
      if request.xhr?
        format.html { render "new", locals: { expense: @expense } }
      end
    end
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      status = "success"
      html   = render_to_string partial: "expense", locals: { expense: @expense }
    else
      status = "error"
    end

    respond_to do |format|
      if request.xhr?
        format.json { render json: { status: status, data: @expense, html: html } }
      end
    end
  end

  def update
    @expense = Expense.find(params[:id])

    if @expense.update_attributes(expense_params)
      status = "success"
      html   = render_to_string partial: "expense", locals: { expense: @expense }
    else
      status = "error"
    end

    respond_to do |format|
      if request.xhr?
        format.json { render json: { status: status, data: @expense, html: html } }
      end
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    respond_to do |format|
      if request.xhr?
        format.json { render json: { status: "success" } }
      end
    end
  end

  private

  def expense_params
    params.require("expense").permit(:purpose, :responsible, :payday, :in_out,
                                     items_attributes: [:id, :name, :count, :unit_price, :_delete])
  end
end
