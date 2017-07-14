class ContactController < ApplicationController
  def create
    @contact = Contact.create(contact_params)
    @company = Company.find(@contact.company_id)

    redirect_to company_path(@company)
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email, :company)
  end
end
