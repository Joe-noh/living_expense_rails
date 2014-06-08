class RecordsController < ApplicationController

  def index
    @records = Record.all
  end

  def new
    @record = Record.new
    @record.items.build

    respond_to do |format|
      format.html if request.xhr?
    end
  end

  def edit
    @record = Record.find(params[:id])

    respond_to do |format|
      format.html if request.xhr?
    end
  end

  def create
    @record = Record.new(record_params)

    if @record.save
      status = "success"
      html   = render_to_string partial: "record", locals: { record: @record }
    else
      status = "error"
    end

    respond_to do |format|
      if request.xhr?
        format.json { render json: { status: status, data: @record, html: html } }
      end
    end
  end

  def update
    @record = Record.find(params[:id])

    if @record.update_attributes(record_params)
      status = "success"
      html   = render_to_string partial: "record", locals: { record: @record }
    else
      status = "error"
    end

    respond_to do |format|
      if request.xhr?
        format.json { render json: { status: status, data: @record, html: html } }
      end
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy

    respond_to do |format|
      if request.xhr?
        format.json { render json: { status: "success" } }
      end
    end
  end

  private

  def record_params
    params.require("record").permit(:purpose, :responsible, :payday, :in_out,
                                    items_attributes: [:id, :name, :count, :unit_price, :_delete])
  end
end