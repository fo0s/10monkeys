# Loads a text file, sorts it and counts number of words
class ComparativeData
  attr_reader :output

  def initialize(file)
    @input = file
    @output = []
  end

  def process_file
    hash_values = {}
    target_file = File.open(@input, 'r')
    # Process each line
    target_file.each_line do |line|
      words = line.split
      words.each do |word|
        hash_values[word] = hash_values.key?(word) ? hash_values[word] + 1 : 1
      end
    end
    # sort the hash by value. Store for future extraction
    hash_values.sort_by { |value| value[1] }.each do |element|
      @output << [element[0], element[1]]
    end

    return true
  end
end
