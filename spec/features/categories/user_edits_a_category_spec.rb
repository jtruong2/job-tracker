require 'rails_helper'
RSpec.describe "User edits a category" do
  scenario "updates category information" do
    category = create(:category)
    visit categories_path
    click_on "Edit"
    fill_in "category_title", with: category.title
    click_on "Update Category"

    expect(page).to have_content(category.title)
  end
end
