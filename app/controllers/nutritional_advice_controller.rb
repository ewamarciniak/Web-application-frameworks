class NutritionalAdviceController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_tab

  def set_tab
    @tab="advice"
  end

  def index
  end
end
