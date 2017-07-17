class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, :category_id, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.get_attributes
    attributes = Job.new.attributes.keys
    attributes.keep_if {|attribute| attribute == "city" || attribute == "level_of_interest"}
    attributes[0] = "interest"
    attributes
  end

  def self.sort_city
    Job.all.order(:city => :asc)
  end

  def self.sort_level_of_interest
    Job.all.order(:level_of_interest => :desc)
  end

  def sort_date
    Job.all.order(:created_at => :desc)
  end
end
