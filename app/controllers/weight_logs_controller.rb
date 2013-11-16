class WeightLogsController < ApplicationController
  before_filter :authenticate_user!

  # GET /weight_logs
  # GET /weight_logs.json
  def index
    @weight_logs = current_user.weight_logs.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weight_logs }
    end
  end

  # GET /weight_logs/1
  # GET /weight_logs/1.json
  def show
    @weight_log = WeightLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weight_log }
    end
  end

  # GET /weight_logs/new
  # GET /weight_logs/new.json
  def new
    @weight_log = WeightLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weight_log }
    end
  end

  # GET /weight_logs/1/edit
  def edit
    @weight_log = WeightLog.find(params[:id])
  end

  # POST /weight_logs
  # POST /weight_logs.json
  def create
    @weight_log = WeightLog.new(params[:weight_log])

    respond_to do |format|
      if @weight_log.save
        format.html { redirect_to @weight_log, notice: 'Weight log was successfully created.' }
        format.json { render json: @weight_log, status: :created, location: @weight_log }
      else
        format.html { render action: "new" }
        format.json { render json: @weight_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /weight_logs/1
  # PUT /weight_logs/1.json
  def update
    @weight_log = WeightLog.find(params[:id])

    respond_to do |format|
      if @weight_log.update_attributes(params[:weight_log])
        format.html { redirect_to @weight_log, notice: 'Weight log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @weight_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weight_logs/1
  # DELETE /weight_logs/1.json
  def destroy
    @weight_log = WeightLog.find(params[:id])
    @weight_log.destroy

    respond_to do |format|
      format.html { redirect_to weight_logs_url }
      format.json { head :no_content }
    end
  end
end
