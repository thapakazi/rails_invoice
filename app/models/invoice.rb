require 'roo'
require 'pry'

class Invoice < ApplicationRecord
  validates :item, presence: true
  validates :price, :presence => true,
            :numericality => true

  def self.import(file)

    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    # binding.pry
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      invoice = find_by(id: row["id"]) || new
      valid_fields = ["id","item","price","details"]
      invoice.attributes = row.to_hash.slice(*valid_fields)
      invoice.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
