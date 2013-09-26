=begin
  
Create a class named CSVReader with an initialize method that takes 
the name of a file and saves it to an instance variable named @fname. 
The CSVReader class should also have getter and setter methods for fname.

Headers=

Create a headers= setter method. The headers= method should take a String 
and then convert the String into an Array. The CSVReader class should create 
getter and setter methods for headers as well:

=end

#Define CSVReader class
class CSVReader

  attr_accessor :fname, :headers

  def initialize(file_name)
    @fname = file_name
  end

  # Convert string into headers & clean up syntax
  def headers=(string)
    @headers = string.split(',')
    @headers.map! do |word|
      # Strip quotes
      word.gsub!('"')
      # Strip spaces and newlines
      word.strip!
      # Transform string into a snake_case symbol
      word.underscore.to_sym
    end
  end

  def create_hash(values)
    hash = {}
    @headers.each_with_index do |header, index|
      value = values[i].strip.gsub('"', '')
      hash[header] = value unless value.empty?
    end
    hash
  end

end

# Add method to String class to transform strings into snake_case
class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end