require 'rails_helper'
RSpec.describe "User visits job page" do
  scenario "sees a form for comments and existing comments" do
    company = create(:company)
    job = create(:job, company_id: company.id)
    comment1, comment2, comment3 = create_list(:comment, 3, job_id: job.id)

    visit company_job_path(company, job)

    expect(page).to have_content(comment1.content)
    expect(page).to have_content(comment2.content)
    expect(page).to have_content(comment3.content)

  end
end
