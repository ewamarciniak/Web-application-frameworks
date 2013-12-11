class NutritionalAdviceController < ApplicationController
  before_filter :authenticate_user!
  def index
    @tab="advice"
  end
end
