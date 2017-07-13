require 'rails_helper'
RSpec.describe "User deletes job" do
  scenario "removes job from jobs index" do
    company = create(:company)
    job1, job2, job3 = create_list(:job, 3, company_id: company.id)
    visit company_jobs_path(company)
    first(:link, "Delete").click

    expect(page).to_not have_content(job1.title)
  end
end
