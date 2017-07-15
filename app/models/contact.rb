class Contact < ApplicationRecord
  validates_presence_of :full_name, :position, :email, :company_id
  belongs_to :company
end
