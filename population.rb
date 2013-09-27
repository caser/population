require_relative 'lib/setup'
require_relative 'lib/analytics'

class Population

  attr_accessor :analytics

  def initialize

    areas = Setup.new.areas

    @analytics = Analytics.new(areas)

  end

  def menu

    system 'clear'

    p "Population Menu"
    p "---------------"

    @analytics.options.each do |option|
      puts "#{option[:menu_id]}. #{option[:menu_title]}"
    end

  end

  def run

    response = false

    while response != :exit do

      # Run the menu
      self.menu

      # Get the choice from the user
      print "Choice: "
      choice = gets.chomp.to_i

      # Run the user choice
      response = @analytics.run(choice)

      # Check if program should exit
      if response == :exit

        puts "Exiting..."

      else

        print "Press enter to continue."

        gets.chomp

      end

    end

  end

end

p = Population.new
p.run