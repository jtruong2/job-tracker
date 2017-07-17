class Dashboard < ApplicationRecord
  def self.top_companies_by_interest
    @interests = Job.all.order(:company_id)
  end
end
