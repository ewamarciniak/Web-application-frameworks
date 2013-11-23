class FoodIntakeLogsController < ApplicationController
  before_filter :authenticate_user!
  # GET /food_intake_logs
  # GET /food_intake_logs.json
  def index
    @food_intake_logs = current_user.food_intake_logs.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @food_intake_logs }
    end
  end

  # GET /food_intake_logs/1
  # GET /food_intake_logs/1.json
  def show
    @food_intake_log = FoodIntakeLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @food_intake_log }
    end
  end

  # GET /food_intake_logs/new
  # GET /food_intake_logs/new.json
  def new
    @food_intake_log = FoodIntakeLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @food_intake_log }
    end
  end

  # GET /food_intake_logs/1/edit
  def edit
    @food_intake_log = FoodIntakeLog.find(params[:id])
  end

  # POST /food_intake_logs
  # POST /food_intake_logs.json
  def create
    @food_intake_log = FoodIntakeLog.new(params[:food_intake_log])
    @food_intake_log.calories = @food_intake_log.calculate_calories_intake
    @food_intake_log.carbohydrates = @food_intake_log.calculate_carbohydrates_intake
    @food_intake_log.cholesterol = @food_intake_log.calculate_cholesterol_intake
    @food_intake_log.fibre = @food_intake_log.calculate_fibre_intake
    @food_intake_log.protein = @food_intake_log.calculate_protein_intake
    @food_intake_log.saturated_fats = @food_intake_log.calculate_saturated_fats_intake
    @food_intake_log.unsaturated_fats = @food_intake_log.calculate_unsaturated_fats_intake
    @food_intake_log.sugars = @food_intake_log.calculate_sugars_intake

    respond_to do |format|
      if @food_intake_log.save
        format.html { redirect_to @food_intake_log, notice: 'Food intake log was successfully created.' }
        format.json { render json: @food_intake_log, status: :created, location: @food_intake_log }
      else
        format.html { render action: "new" }
        format.json { render json: @food_intake_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /food_intake_logs/1
  # PUT /food_intake_logs/1.json
  def update
    @food_intake_log = FoodIntakeLog.find(params[:id])
    @food_intake_log.calories = @food_intake_log.calculate_calories_intake
    @food_intake_log.carbohydrates = @food_intake_log.calculate_carbohydrates_intake
    @food_intake_log.cholesterol = @food_intake_log.calculate_cholesterol_intake
    @food_intake_log.fibre = @food_intake_log.calculate_fibre_intake
    @food_intake_log.protein = @food_intake_log.calculate_protein_intake
    @food_intake_log.saturated_fats = @food_intake_log.calculate_saturated_fats_intake
    @food_intake_log.unsaturated_fats = @food_intake_log.calculate_unsaturated_fats_intake
    @food_intake_log.sugars = @food_intake_log.calculate_sugars_intake

    respond_to do |format|
      if @food_intake_log.update_attributes(params[:food_intake_log])
        format.html { redirect_to @food_intake_log, notice: 'Food intake log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food_intake_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_intake_logs/1
  # DELETE /food_intake_logs/1.json
  def destroy
    @food_intake_log = FoodIntakeLog.find(params[:id])
    @food_intake_log.destroy

    respond_to do |format|
      format.html { redirect_to food_intake_logs_url }
      format.json { head :no_content }
    end
  end
end
