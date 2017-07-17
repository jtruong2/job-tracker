require 'rails_helper'
RSpec.describe "User visits /jobs"
  scenario "sees a list of jobs sorted by city" do
    job1 = create(:job)
    job2 = create(:job, city: "Seattle")
    job3 = create(:job, city: "Miami")

    visit '/jobs'
    select("location", from: "sort").select_option
    click_on "filter"

    expect(page).to
  end

  scenario "sees a list of jobs sorted by interest" do

  end

  scenario "sees jobs with count by level of interest" do
    job1, job2 = create(:job)

    visit '/dashboard'

    expect(page).to have_content("45: 60")
  end

  scenario "sees top three companies ranked by level of interest with average" do
    job1, job2, job3, job4 = create_list(:job)

    visit '/dashboard'

    expect(page).to
  end

  scenario "sees job count by location" do
    job1, job2, job3 = create_list(:job)

    visit '/dashboard'

    expect(page).to have_content("Denver: 3")
  end
end
