require 'rails_helper'
RSpec.describe "User visits individual category page" do
  scenario "sees all jobs for this category" do
    category = create(:category)
    job = create(:job, category_id: category.id)
  end
end
