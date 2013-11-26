class SiteController < ApplicationController
  def index
    @weight_logs = current_user.weight_logs.all
  end


end
