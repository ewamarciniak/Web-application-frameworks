class FoodCategoriesController < ApplicationController
  before_filter :ensure_admin
  before_filter :set_tab
  # GET /food_categories
  # GET /food_categories.json

  def set_tab
    @tab="food_categories"
  end

  def index
    @food_categories = FoodCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @food_categories }
    end
  end

  # GET /food_categories/1
  # GET /food_categories/1.json
  def show
    @food_category = FoodCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @food_category }
    end
  end

  # GET /food_categories/new
  # GET /food_categories/new.json
  def new
    @food_category = FoodCategory.new
  end

  # GET /food_categories/1/edit
  def edit
    @food_category = FoodCategory.find(params[:id])
  end

  # POST /food_categories
  # POST /food_categories.json
  def create
    @food_category = FoodCategory.new(params[:food_category])

    respond_to do |format|
      if @food_category.save
        format.html { redirect_to food_categories_url}
        format.json { render json: @food_category, status: :created, location: @food_category }
        format.js
      else
        format.html { redirect_to food_categories_url}
        format.json { render json: @food_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /food_categories/1
  # PUT /food_categories/1.json
  def update
    @food_category = FoodCategory.find(params[:id])

    respond_to do |format|
      if @food_category.update_attributes(params[:food_category])
        format.html { redirect_to @food_category, notice: 'Food category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_categories/1
  # DELETE /food_categories/1.json
  def destroy
    @food_category = FoodCategory.find(params[:id])
    @food_category.destroy

    respond_to do |format|
      format.html { redirect_to food_categories_url }
      format.json { head :no_content }
      format.js
    end
  end
end
