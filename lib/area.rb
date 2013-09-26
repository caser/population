# Define the area class
class Area

  attr_accessor :zipcode, :estimated_population
  attr_accessor :city, :state

  # args is a hash
  def initialize(args)
    @zipcode = args[:zipcode].to_i || 0
    @estimated_population = args[:estimated_population].to_i || 0
    @city = args[:city] || "n/a"
    @state = args[:state] || "n/a"
  end

  # Output area information in an aggregate string
  def to_s
    "#{city}, #{state}, #{zipcode} has #{estimated_population} people."
  end

end