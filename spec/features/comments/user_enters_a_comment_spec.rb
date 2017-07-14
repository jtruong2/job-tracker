require 'rails_helper'
RSpec.describe "User enters a comment on job page" do
  scenario "page updates with comment" do
    job = create(:job)

    visit company_job_path(job.company_id, job)
    fill_in("comment_content", with: 'Hello World!')
    click_on("Create Comment")

    expect(page).to have_content("Hello World!")

  end
end
