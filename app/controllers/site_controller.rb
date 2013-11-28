class SiteController < ApplicationController
  def index
    @weight_logs = current_user.weight_logs.all if current_user
  end


end
