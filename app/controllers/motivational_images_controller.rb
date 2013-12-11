class MotivationalImagesController < ApplicationController
  before_filter :authenticate_user!
  # GET /motivational_images
  # GET /motivational_images.json
  def index
    @motivational_images = current_user.motivational_images.all
    @tab="images"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @motivational_images }
    end
  end

  # GET /motivational_images/1
  # GET /motivational_images/1.json
  def show
    @motivational_image = MotivationalImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @motivational_image }
    end
  end

  # GET /motivational_images/new
  # GET /motivational_images/new.json
  def new
    @motivational_image = MotivationalImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @motivational_image }
    end
  end

  # GET /motivational_images/1/edit
  def edit
    @motivational_image = MotivationalImage.find(params[:id])
  end

  # POST /motivational_images
  # POST /motivational_images.json
  def create
    @motivational_image = MotivationalImage.new(params[:motivational_image])

    respond_to do |format|
      if @motivational_image.save
        format.html { redirect_to @motivational_image, notice: 'Motivational image was successfully created.' }
        format.json { render json: @motivational_image, status: :created, location: @motivational_image }
      else
        format.html { render action: "new" }
        format.json { render json: @motivational_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /motivational_images/1
  # PUT /motivational_images/1.json
  def update
    @motivational_image = MotivationalImage.find(params[:id])

    respond_to do |format|
      if @motivational_image.update_attributes(params[:motivational_image])
        format.html { redirect_to @motivational_image, notice: 'Motivational image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @motivational_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motivational_images/1
  # DELETE /motivational_images/1.json
  def destroy
    @motivational_image = MotivationalImage.find(params[:id])
    @motivational_image.destroy

    respond_to do |format|
      format.html { redirect_to motivational_images_url }
      format.json { head :no_content }
    end
  end
end
