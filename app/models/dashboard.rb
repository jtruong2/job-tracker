class Dashboard < ApplicationRecord

  def self.all_level_of_interest
    Job.all.group(:level_of_interest).order('count_id DESC').count(:id)
  end

  def self.top_average_level_of_interest
    Job.group(:company_id).order('average_level_of_interest DESC').limit(3).average(:level_of_interest)
  end

  def self.count_jobs_by_city
    Job.group(:city).order('count_id DESC').count(:id)
  end

end
