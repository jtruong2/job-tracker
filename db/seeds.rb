require 'csv'
require './app/models/category.rb'
Company.destroy_all
Job.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample)
    puts "  Created #{company.jobs[num].title}"
  end
end

def from_csv(file_path)
  values = []
  contents = CSV.foreach(file_path, headers: true, header_converters: :symbol)
  contents.each {|row| values << row.to_h}
  values
end

def seed_categories(file_path)
  values = from_csv(file_path)
  categories = values.each do |row|
    row.keep_if {|k,v| k == :occ_title}
  end
  categories.uniq.each {|category| Category.create!(title: category[:occ_title])}
end

seed_categories("db/csv/jobs.csv")
