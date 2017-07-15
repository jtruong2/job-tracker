class ContactController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]
    @contact.save

    @company = Company.find(@contact.company_id)

    redirect_to company_path(@company)
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email)
  end
end
