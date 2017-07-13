require 'rails_helper'
RSpec.describe "User edits a single job" do
  scenario "updates job information" do
    job = create(:job)
    new_job = build(:job, description: "fight fires", level_of_interest: 55)

    visit company_jobs_path(job.company.id)
    click_on "Edit"
    fill_in "job_title", with: new_job.title
    fill_in "job_description", with: new_job.description
    fill_in "job_level_of_interest", with: new_job.level_of_interest
    click_on "Update Job"

    save_and_open_page
    expect(page).to have_content new_job.title
    expect(page).to have_content new_job.description
    expect(page).to have_content new_job.level_of_interest
    expect(current_path).to eq(company_job_path(job.company, new_job))

  end
end
