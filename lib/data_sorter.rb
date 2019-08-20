# frozen_string_literal: true

require 'pdf/reader'

# Loads a text file, sorts it and counts number of words
class ComparativeData
  attr_reader :output

  def initialize(file)
    @input      = file
    @output     = []
  end

  def process_file
    hash_values = {}

    # Check if pdf file
    contents = File.open(@input, 'r') { |f| f.read(8) }

    if (contents =~ /\%PDF-\d\.\d/) == 0
      # Convert from pdf to txt file
      PDF::Reader.open(@input) do |reader|
        pdf_txt = reader.pages.map do |page|
          begin
            page.text
          rescue StandardError
            puts 'Failed to convert'
            ''
          end
        end
        File.write @input + '.txt', pdf_txt.join("\n")
        @input += '.txt'
      end
    end

    # Process text file
    target_file = File.open(@input, 'r')
    target_file.each_line do |line|
      words = line.split
      words.each do |word|
        if word =~ /[a-z]/i
          new_word = word.downcase.gsub(/[^a-z0-9\s]/i, '')
          hash_values[new_word] = hash_values.key?(new_word) ? hash_values[new_word] + 1 : 1
        end
      end
    end
    # sort the hash by value. Store for future extraction
    hash_values.sort_by { |value| value[1] }.each do |element|
      @output << [element[0], element[1]]
    end
    # Test assignment
    true
  end
end
