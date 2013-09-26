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

  # Create a hash with the header as key and the array value as value
  # Used for creating a hash in the 'read' method
  def create_hash(values)

    hash = {}

    @headers.each_with_index do |header, index|
      value = values[i].strip.gsub('"', '')
      hash[header] = value unless value.empty?
    end

    return hash

  end

  def read

    # Creates a read-only instance of the Ruby File class
    file = File.new(@fname, "r")

    # Assigns headers
    self.headers = file.readline

    # Read through the file, using the create_hash method above to create a new hash
    # for each area, and then yielding that has back to the calling method
    while (!file.eof? && next_line = file.readline)
      values = next_line.split(',')
      hash = create_hash(values)
      yield(hash)
    end

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