require 'rails_helper'
RSpec.describe "User visits /jobs?sort=location" do
  scenario "sees a list of jobs sorted by city" do
    job1 = create(:job)
    job2 = create(:job, city: "Seattle")
    job3 = create(:job, city: "Miami")

    visit '/jobs'

    select("location", from: "sort").selct_option

    expect(page).to
  end
end
