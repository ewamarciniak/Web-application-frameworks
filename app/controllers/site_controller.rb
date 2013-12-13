class SiteController < ApplicationController
  before_filter :authenticate_user!, :only => [:dashboard]

  def index
    @tab="site"
  end

  def dashboard
    @tab="dashboard"
  end
end