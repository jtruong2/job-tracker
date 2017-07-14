require 'rails_helper'
RSpec.describe "User visits company show page" do
  scenario "enters multiple contact info and redirected to show page" do
    company = create(:company)
    contact1, contact2 = create_list(:contact, 2, company_id: company.id)

    visit company_path(company)
    fill_in("contact_full_name", with: contact1.full_name)
    fill_in("contact_position", with: contact1.position)
    fill_in("contact_email", with: contact1.email)
    fill_in("contact_company", with: company.name)
    click_on("Create Contact")

    fill_in("contact_fullname", with: contact1.full_name)
    fill_in("contact_position", with: contact1.position)
    fill_in("contact_email", with: contact1.email)
    fill_in("contact_company", with: company.name)
    click_on("Create Contact")

    expect(page).to have_content(contact1.full_name)
    expect(current_path).to eq(company_path(company))
  end
end
