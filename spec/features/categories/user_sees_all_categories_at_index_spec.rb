require 'rails_helper'
RSpec.describe "User visits categories index" do
  scenario "sees all categories" do
    category1, category2 = create_list(:category, 2)
    visit categories_path
    expect(page).to have_content(category1.title)
    expect(page).to have_content(category2.title)
    expect(page).to have_content("All Job Categories")
  end
end
