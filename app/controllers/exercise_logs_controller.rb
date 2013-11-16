class ExerciseLogsController < ApplicationController
  before_filter :authenticate_user!
  # GET /exercise_logs
  # GET /exercise_logs.json
  def index
    @exercise_logs = ExerciseLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exercise_logs }
    end
  end

  # GET /exercise_logs/1
  # GET /exercise_logs/1.json
  def show
    @exercise_log = ExerciseLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exercise_log }
    end
  end

  # GET /exercise_logs/new
  # GET /exercise_logs/new.json
  def new
    @exercise_log = ExerciseLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exercise_log }
    end
  end

  # GET /exercise_logs/1/edit
  def edit
    @exercise_log = ExerciseLog.find(params[:id])
  end

  # POST /exercise_logs
  # POST /exercise_logs.json
  def create
    @exercise_log = ExerciseLog.new(params[:exercise_log])
    @exercise_log.calories_burned = @exercise_log.calculate_calories_burned

    respond_to do |format|
      if @exercise_log.save
        format.html { redirect_to @exercise_log, notice: 'Exercise log was successfully created.' }
        format.json { render json: @exercise_log, status: :created, location: @exercise_log }
      else
        format.html { render action: "new" }
        format.json { render json: @exercise_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exercise_logs/1
  # PUT /exercise_logs/1.json
  def update
    @exercise_log = ExerciseLog.find(params[:id])

    respond_to do |format|
      if @exercise_log.update_attributes(params[:exercise_log])
        format.html { redirect_to @exercise_log, notice: 'Exercise log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exercise_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_logs/1
  # DELETE /exercise_logs/1.json
  def destroy
    @exercise_log = ExerciseLog.find(params[:id])
    @exercise_log.destroy

    respond_to do |format|
      format.html { redirect_to exercise_logs_url }
      format.json { head :no_content }
    end
  end
end
