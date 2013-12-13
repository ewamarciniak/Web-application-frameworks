class StatsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @weight_logs = current_user.weight_logs.all if current_user
    @tab="stats"
  end
end
