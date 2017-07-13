require 'rails_helper'
RSpec.describe "User creates a new category" do
  context "with valid params" do
    scenario "adds category to index" do
      category = build(:category)

      visit categories_path
      click_on "Add new category"
      fill_in("category_title", with: category.title)
      click_on "Create Category"



      expect(page).to have_content(category.title)
      expect(page).to have_content("All jobs for #{category.title}'s")
    end
  end

  context "with invalid params" do
    scenario "re-renders a new page" do

      visit categories_path
      click_on "Add new category"
      click_on "Create Category"

      expect(page).to have_content("Add new Job Category")
    end
  end
end
