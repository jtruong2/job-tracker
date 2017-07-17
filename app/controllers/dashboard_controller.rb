class DashboardController < ApplicationController
  def index
    @interests = Dashboard.all_level_of_interest
    @top_average_level_of_interest = Dashboard.top_average_level_of_interest
    @count_jobs_by_city = Dashboard.count_jobs_by_city
  end
end
