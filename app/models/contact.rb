class Contact < ApplicationRecord
  validates_presence_of :full_name, :position, :email, :company
  belongs_to :company
end
