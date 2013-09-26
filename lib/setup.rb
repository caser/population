require_relative 'csv_reader'
require_relative 'area'

# Define setup class
class Setup

  attr_accessor :areas

  # Create new CSVReader object pointing to the population CSV data
  def initialize

    csv = CSVReader.new("./free-zipcode-database.csv")

    @areas = []

    csv.read do |item|
      @areas << Area.new(item)
    end

    return self

  end

end