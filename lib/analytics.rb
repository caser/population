# Define Analytics class
class Analytics

  attr_accessor :options

  def initialize(areas)

    @areas = areas

    self.set_options

  end

  # Defines a set of options for analytics that the user can run
  def set_options

    @options = []
    @options << { menu_id: 1, menu_title: 'Areas count', method: :how_many }
    @options << { menu_id: 2, menu_title: 'Smallest Population (non 0)', method: :smallest_pop }
    @options << { menu_id: 3, menu_title: 'Largest Population', method: :largest_pop }
    @options << { menu_id: 4, menu_title: 'How many zips in California?', method: :california_zips}
    @options << { menu_id: 5, menu_title: 'Information for a given zip', method: :zip_info }
    @options << { menu_id: 6, menu_title: 'Exit', method: :exit}

  end

  # Takes a number as an argument and picks the option & associated method
  def run(choice)

    option = @options.select {|option| option[:menu_id] == choice }.first

    if option.nil?

      puts "Invalid choice."

    elsif option[:method] != :exit

      self.send(option[:method])
      :done

    else

      option[:method]

    end

  end

  def how_many

    puts "There are #{@areas.length} areas."

  end

=begin

#Initial implementation of smallest_pop method

  def smallest_pop

    smallest_area = {}

    @areas.each do |area|
      if area.estimated_population == 0
        next
      elsif smallest_area == nil || area.estimated_population < smallest_area.estimated_population
        smallest_area = area
      end
    end

    return smallest_area

  end

=end

  # Bloc suggested implementation of smallest_pop method
  # Return the city and state with the smallest population, excluding thoe ones with zero
  def smallest_pop

      sorted = @areas.sort do |x, y|
        x.estimated_population <=> y.estimated_population
      end

      smallest = sorted.drop_while { |i| i.estimated_population == 0 }.first

      puts "#{smallest.city}, #{smallest.state} has the smallest population of #{smallest.estimated_population}."

  end

  # Return the city and state with the largest population
  def largest_pop

    sorted = @areas.sort do |x, y|
      x.estimated_population <=> y.estimated_population
    end

    largest = sorted.reverse.drop_while { |i| i == 0 }.first

    puts "#{largest.city}, #{largest.state} has the largest population of #{largest.estimated_population}"

  end

=begin

  # Initial implementation of california_zips method
  
  # Return the number of zip codes in California
  def california_zips

    california = @areas.drop_while { |area| area.state != "CA" }

    puts "There are #{california.length} zip code matches in California."

  end

=end

  # Bloc implementation of california_zips method
  # Return the number of zip codes in California
  def california_zips

    ca = @areas.count { |area| area.state == "CA" }

    puts "There are #{ca} zip code matches in California."

  end

  # Takes a zip code and returns all available information about it
  def zip_info

    # Get user input
    print "Enter zip: "
    zip = gets.chomp.to_i

    zips = @areas.select { |area| area.zipcode == zip }

    unless zips.empty?
      puts ""
      zips.each { |z| p z }
    else
      puts "Zip not found."
    end

  end

end