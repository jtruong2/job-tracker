require 'rails_helper'
RSpec.describe "User visits /dashboard" do
  scenario "sees jobs with count by level of interest" do
    job1, job2 = create_list(:job, 2)

    visit '/dashboard'

    expect(page).to have_content("level 60: 2")
  end

  scenario "sees job count by location" do
    job1, job2, job3 = create_list(:job, 3)

    visit '/dashboard'

    expect(page).to have_content("Denver: 3")
    expect(page).to have_link("Denver", href: "/jobs?location=Denver")
  end
end
