require 'rails_helper'
RSpec.describe "User visits specific job page" do
  scenario "sees form to enter comments" do
    job = create(:job)

    visit company_job_path(job.company_id, job.id)
    save_and_open_page
    expect(page).to have_content("Enter a comment")
  end
end
